require 'rails_helper'

describe StaticPage do

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
  end

end
