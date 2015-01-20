class ContactMailer < ApplicationMailer

  def contact_form_entry(contact)
    @contact = contact
    mail(to: contact.email, subject: 'A new contact form entry has arrived')
  end

end
