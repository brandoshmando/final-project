# Preview all emails at http://localhost:3000/rails/mailers/activation_email
class ActivationEmailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/activation_email/activation_needed_email
  def activation_needed_email
    ActivationEmail.activation_needed_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/activation_email/activation_success_email
  def activation_success_email
    ActivationEmail.activation_success_email
  end

end
