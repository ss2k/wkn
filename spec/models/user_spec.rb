require 'spec_helper'

describe User, '#address' do
  it { should have_one(:address) }
  it { should accept_nested_attributes_for(:address) }
end

