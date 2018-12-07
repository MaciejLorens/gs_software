class UserMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def invitation_email(invitation)
    @token = invitation.token
    @email = invitation.email

    mail(to: @email, from: invitation.company.email, subject: 'Invitation from WGT Notify Turow')
  end

end
