class ContactMailer < ApplicationMailer

  def contact_form_entry(contact)
    @contact = contact
    mail(to: 'info@devsforchange.org', subject: 'A new contact form entry has arrived')
  end

end
