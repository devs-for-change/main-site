class ContactsController < ApplicationController
  helper_method :page

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # Probably should take this off the main wire, but we have no
      #  worker concept implemented yet.  N.B.
      ContactMailer.contact_form_entry(@contact).deliver_now
      render 'pages/contact_thankyou'
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
