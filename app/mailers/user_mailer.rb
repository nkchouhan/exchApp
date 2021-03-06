class UserMailer < ActionMailer::Base
  default from: "pchawdarails@gmail.com"
  
  def withdrawl_confirmation(withdrawl)
    @withdrawl = withdrawl
    mail(to: withdrawl.user.email,
      subject: "Withdrawal confirmation alert! from ##{withdrawl.account_number}")
  end
  def notify_deposit(withdrawl, coin)
    @withdrawl = withdrawl
    @coin = coin
    @admin = withdrawl.user.admin_email
    mail(to: 'eu.sou.chris@hotmail.com',#@admin.email,
      subject: "Deposit Notifiaction")
  end
end
