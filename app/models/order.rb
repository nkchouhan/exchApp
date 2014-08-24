class Order < ActiveRecord::Base
  belongs_to :user
  scope :pending, where(:status => "Pending")
  scope :close, where(:status => "Close")
end
