class ContactsController < ApplicationController
  helper_method :page

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "You're inquiry has been successfully submitted."
      redirect_to '/contact'
    else
      render 'pages/contact'
    end
  end

  private

  def page
    StaticPage.find 'contact'
  end

  def contact_params
    params.required(:contact).permit(:inquiry_type, :name, :email, :company,
                                     :role, :website, :notes)
  end
end
