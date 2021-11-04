class UserMailer < ApplicationMailer
  def reset_password_email
    @user = User.find(user.id)
    @url = edit_password_reset_url(@usre.reset_password_token)
    mail(to: user.email, subject: 'パスワードリセット')
  end
end