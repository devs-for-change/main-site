require "rails_helper"

RSpec.describe ContactMailer, :type => :mailer do
  let!(:contact) { create :contact }
  subject { ContactMailer.contact_form_entry(contact)}
  describe '#contact_form_entry' do
    it 'renders' do
      expect(subject.body).to_not be_nil
    end

    it 'calls mail' do
      expect_any_instance_of(ContactMailer).to receive(:mail)
      subject.deliver_now
    end
  end
end
