class Deposit < ActiveRecord::Base
  belongs_to :user
  def self.to_csv
    CSV.generate do |csv|
      csv << ['Coin','Coin Address','Pull At']
      all.each do |deposit|
        csv << [deposit.coin,deposit.coin_address,deposit.add_pull_at.strftime('%m/%d/%Y at %I:%M%p')]
      end
    end
  end
  
end
