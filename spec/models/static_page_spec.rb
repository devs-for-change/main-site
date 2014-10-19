require 'rails_helper'

describe StaticPage do

  describe '#hide_main_nav?' do
    let(:hidden_page) do
      StaticPage.new(title: 'hidden', slug: 'hidden', hide_main_nav: true)
    end
    let(:visible_page) do
      StaticPage.new(title: 'hidden', slug: 'hidden')
    end

    it 'returns true when page should be hidden' do
      expect(hidden_page).to be_hide_main_nav
    end

    it 'returns true when page should be hidden' do
      expect(visible_page).to_not be_hide_main_nav
    end
  end

  describe '#has_sub_nav?' do
    context 'without sub nav' do
      subject { StaticPage.new(sub_nav_pages: nil)}
      it 'returns false' do
        expect(subject).to_not have_sub_nav_pages
      end
    end

    context 'with sub nav' do

    end
  end

  describe '#sub_nav_pages' do
    let(:page_with_sub_nav) { StaticPage.new(sub_nav_pages: ['index']) }
    let(:page_without_sub_nav) { StaticPage.new }

    it 'returns page objects for sub nav' do
      expect(page_with_sub_nav.sub_nav_pages).to include StaticPage.find('index')
    end

    it 'returns nil if no pages' do
      expect(page_without_sub_nav.sub_nav_pages).to be_nil
    end
  end

  context 'class methods' do
    subject { StaticPage }
    describe  '.all' do
      it 'returns all of the pages' do
        expect(subject.all.count).to eq(StaticPage::PAGES.count)
      end
    end

    describe '.[]' do
      it 'returns the page object requested' do
        expect(subject[:index]).to eq(StaticPage::PAGES.first)
      end
    end

    describe '.titles' do
      it 'returns all page titles' do
        expect(subject.titles).to eq(StaticPage::PAGES.map {|p| p[:title]})
      end
    end

    describe '.find' do
      it 'returns the correct page object' do
        expect(subject.find('index')).to eq StaticPage.all.find { |p| p.slug == 'index' }
      end
    end

  end

end
