class ContactController < ApplicationController

  def new
  end

  def create
  	begin
  		@contact = Contact.new(params[:contact])
  		@contact.request = request
  		if @contact.deliver
  			flash.now[:notice] = 'Thank You for Your Message!'
        render :action => :new
  		else
  			redirect_to :action => :new
  		end
  	rescue ScriptError
  		flash[:error] = 'Sorry, this message appears to be spam and was not delivered'
  	end
  end

end