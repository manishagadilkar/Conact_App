# frozen_string_literal: true

class ContactsController < ApplicationController
  def contact
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    respond_to do |format|
      if @contact
        @contact = Contact.new
        format.html { render 'contact' }
        format.js { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'contact' }
        format.js { flash.now[:error] = @message = 'Message not send.' }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_no, :message)
  end
end
