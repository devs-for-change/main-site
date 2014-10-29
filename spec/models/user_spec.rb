require 'rails_helper'

describe User do
  %i(first_name last_name email).each do |attr|
    it { should validate_presence_of(attr) }
  end
end
