namespace :user do
	desc "generate secrets for each user"
	task :generate_secrets => :environment do
		User.where(:gauth_secret => nil).each do |user|
		 user.send(:assign_auth_secret)
		 user.save
		end
	end
end
