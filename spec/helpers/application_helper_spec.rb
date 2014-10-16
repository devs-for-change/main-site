require 'rails_helper'

describe ApplicationHelper do
  describe '#static_pages' do
    it 'returns all static pages' do
      expect(helper.static_pages).to eq(StaticPage.all)
    end
  end
end
