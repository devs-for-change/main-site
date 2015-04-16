require 'rails_helper'

feature 'admin dashboard' do
  let(:user) { create(:user) }
  before(:each) do
    capy_login
  end

  it "accesses the dashboard" do
    expect(page).to have_text('Recent Contact Inquiries')
  end

end
