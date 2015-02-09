require 'rails_helper'
feature 'contacts dashboard' do

  let(:user) { create :user }
  let!(:fun_fact) { create :fun_fact, text: 'Super Duper Fun Fact' }
  before do
    capy_login
  end

  describe 'GET index' do
    it 'returns success' do
      visit '/admin/fun_facts'
      expect(page).to have_text('Super Duper Fun Fact')
    end
  end

  describe 'GET edit' do
    it 'returns form with values in place' do
      visit "admin/fun_facts/#{fun_fact.id}/edit"
      expect(page).to have_xpath("//input[@value='Super Duper Fun Fact']")
    end
  end

end
