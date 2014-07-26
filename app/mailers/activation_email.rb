class ActivationEmail < ActionMailer::Base
  default from: "brancraft@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.activation_email.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url ="http://0.0.0.0:3000/users/#{user.activation_token}/activate"
    mail to: user.email, subject: "Welcome to Dr. Rubric #{user.first_name}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.activation_email.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url ="http://0.0.0.0:3000/login"

    mail to: user.email, "#{user.name}, your account has been activated!"
  end
end
