class ContactUsMailer < ApplicationMailer
   def welcome_email(contact)
    @contact= contact
    email1="manishagadilkar93@gmail.com"
    email2=@contact.email
    recipients = email1, email2
    # attachments.inline['logo.png'] = File.read('/assets/logo.png')
     mail(:from => ENV['GMAIL_USERNAME'] :to =>recipients.join(','),:subject => "Quick Contact us Message")
  end
end
