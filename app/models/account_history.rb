class AccountHistory < ActiveRecord::Base
  belongs_to :user
=begin
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |account_history|
        csv << account_history.attributes.values_at(*column_names)
      end
    end
  end
=end
  def self.to_csv
    CSV.generate do |csv|
      csv << ['Account Date(MM/DD/YYYY)','BTC Coin','DOGE Coin','GCS Coin','LTC Coin','Detail']
      all.each do |account_history|
        #csv << account_history.attributes.values_at('id','ac_date','btc','doge','gcs','ltc','details')
        csv << [account_history.ac_date.strftime('%m/%d/%Y'),account_history.btc.to_i,account_history.doge.to_i,account_history.gcs.to_i,account_history.ltc.to_i,account_history.details] unless account_history.ac_date.blank?
      end
    end
  end
end
