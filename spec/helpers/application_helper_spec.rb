require 'rails_helper'

describe ApplicationHelper do
  describe '#static_pages' do
    it 'returns all static pages' do
      expect(helper.static_pages).to eq(StaticPage.all)
    end
  end

  context 'with sub nav' do
    before do
      allow(helper).to receive(:page).and_return StaticPage.new(sub_nav_pages: ['index'])
    end

    describe '#sub_nav_for_current_page?' do
      it 'should return true' do
        expect(helper.sub_nav_for_current_page?).to eq true
      end
    end

    describe '#sub_nav_links' do
      it 'returns the correct link' do
        expect(helper.sub_nav_links).to include helper.link_to('Home', index_path)
      end
    end

    describe '#sub_nav_pages_for_current_page' do
      it 'returns the correct page' do
        expect(helper.sub_nav_pages_for_current_page).to include StaticPage.find('index')
      end
    end
  end
end
