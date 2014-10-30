require 'rails_helper'

describe User do
  %i(first_name last_name email).each do |attr|
    it { should validate_presence_of(attr)}
  end

  describe 'class methods' do
    subject { User }
    describe '.serialize_from_session' do
      it 'calls to_adapter#get' do
        to_adapter = double(:to_adapter)
        allow(subject).to receive(:to_adapter).and_return to_adapter
        expect(to_adapter).to receive(:get).with('a')
        key = [{'$oid' => 'a'}]
        subject.serialize_from_session(key, '')
      end
    end

    describe '.primary_key' do
      it 'returns id' do
        expect(subject.primary_key).to eq 'id'
      end
    end
  end


end
