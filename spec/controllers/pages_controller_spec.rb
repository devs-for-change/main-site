require 'rails_helper'

describe PagesController, type: :controller do
  describe '#title helper method' do
    it 'should have the correct title' do
      get :index
      expect(subject.view_context.title).to eq 'Home'
    end
  end
end
