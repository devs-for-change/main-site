require 'rails_helper'

describe PagesController, type: :controller do
  describe '#title helper method' do
    it 'should have the correct title' do
      get :index
      expect(subject.view_context.title).to eq 'Home'
    end
  end

  describe '#page' do
    it 'should return the correct page object' do
      get :index
      expect(subject.view_context.page).to eq StaticPage.all.find {|p| p.slug == 'index'}
    end
  end

end
