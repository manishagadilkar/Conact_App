# frozen_string_literal: true

class ContactUsMailer < ApplicationMailer
  def welcome_email(contact)
    @contact = contact
    email1 = 'info@ajackus.com'
    email2 = @contact.email
    recipients = email1, email2
    mail(from: ENV['GMAIL_USERNAME'], to: recipients.join(','), subject: 'Quick Contact us Message')
 end
end
