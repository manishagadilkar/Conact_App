class Contact < ApplicationRecord
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates_numericality_of :phone_no, only_integer: true
  validates_presence_of :first_name, :last_name, :phone_no, :message
  after_commit :send_email

  def send_email
    ContactUsMailer.welcome_email(self).deliver_now
  end
end
