class User < ActiveRecord::Base
	attr_accessor :gauth_token
	
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  has_many :orders
  has_many :withdrawls
  has_many :deposits
  has_many :account_histories
  
  after_create :assign_default_role, :set_random_account_number

  def assign_default_role
    add_role(:user) if self.roles.blank?
  end
  
  def admin_email
    count_admin_user = 0
    admin_obj = ""
    User.all.each do |user|
      if (user.has_role? :admin) && count_admin_user == 0
        count_admin_user = 1
        admin_obj = user
        break
      end
    end
    admin_obj
  end
  
  
	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
			data = access_token.info
			user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
			if user
				return user
			else
				registered_user = User.where(:email => access_token.info.email).first
				if registered_user
					return registered_user
				else
					user = User.create(first_name: data["first_name"], 
					  last_name: data["last_name"],
						provider:access_token.provider,
						email: data["email"],
						uid: access_token.uid ,
						confirmed_at: Date.today,
						password: Devise.friendly_token[0,20],
					)
				end
		 end
	end
  
  def set_random_account_number
    self.update_attributes(:account_no => Random.new.rand(1_000_000..10_000_000-1))
  end
  def get_today_deposit
    self.deposits.where("created_at >= ? AND created_at <= ?", Date.today.beginning_of_day, Date.today.end_of_day) 
  end
end
