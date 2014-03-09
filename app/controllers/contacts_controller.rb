class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    begin
      @contact = Contact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
        flash.now[:error]  = nil
        flash.now[:notice] = nil
      else
        flash.now[:error]  = 'Unable to send message.'
        render :new
      end
    rescue ScriptError 
        flash[:error] = "Spam alert!."
    end 
  end
end
