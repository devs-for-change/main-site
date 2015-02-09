require 'spec_helper'

describe FunFacts do
  describe '.primary_key' do
    it 'returns "id"' do
      expect(subject.class.primary_key).to eq 'id'
    end
  end
end
