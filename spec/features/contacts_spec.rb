require 'rails_helper'
feature 'contacts dashboard' do

  let(:user) { create :user }
  let!(:contact) { create :contact, name: "Fancy Fred" }
  before do
    capy_login
  end

  describe 'GET index' do
    it 'returns success' do
      visit '/admin/contacts'
      expect(page).to have_text('Fancy Fred')
    end
  end

end
