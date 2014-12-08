ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Contact Inquiries" do
          table_for Contact.recent do
            column('Name') { |contact| link_to contact.name, admin_contact_path(contact) }
            column('Email') { |contact| contact.email }
            column('Notes') { |contact| contact.notes }
            column('Received On') { |contact| contact.created_at }
          end
        end
      end
    end
  end
end
