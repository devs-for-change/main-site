require 'rails_helper'

describe ApplicationHelper do
  describe '#static_pages' do
    it 'returns all static pages' do
      expect(helper.static_pages).to eq(StaticPage.all)
    end
  end

  describe '#users' do
    let!(:user1) { create(:user, email: 'blar@blar.com') }
    let!(:user2) { create(:user, email: 'blar1@blar.com') }
    it 'returns all users' do
      expect(helper.users).to eq(User.all.to_a)
    end
  end

  describe '#fun_facts' do
    let!(:fun_facts) { create_list(:fun_fact, 2) }
    it 'returns all fun facts' do
      expect(helper.fun_facts).to eq(FunFacts.all.to_a)
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

    describe '#nav_class_for' do
      let(:page) { StaticPage.new(sub_nav_pages: ['index']) }

      it 'returns active if the current page is active' do
        allow(helper).to receive(:page).and_return page
        expect(helper.nav_class_for(page)).to eq('active')
      end

      it 'retuns an empty string the current page is not active' do
        expect(helper.nav_class_for(page)).to eq('')
      end

    end
  end
end
