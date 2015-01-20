class ContactMailerPreview < ActionMailer::Preview
  def contact_form_entry

    if (contact = Contact.last)
      ContactMailer.contact_form_entry(contact)
    else
      # make a sample.
      contact = Contact.create do |contact|
        contact.inquiry_type = "Test"
        contact.name = "Nic Boie"
        contact.email = "nic@devsforchange.org"
        contact.company = "Devs for Change"
        contact.role = "Awesome"
        contact.website = "http://www.devsforchange.org"
        contact.notes = "Note."
      end
      ContactMailer.contact_form_entry(contact).deliver

    end
  end

end
