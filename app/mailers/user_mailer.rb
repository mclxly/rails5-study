class UserMailer < ApplicationMailer
  default from: 'notifications@githere.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://githere.com/login'
    mail(to: @user.email, subject: '欢迎新用户')
  end
end
