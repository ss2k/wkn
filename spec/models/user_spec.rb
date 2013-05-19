require 'spec_helper'

describe User, '#address' do
  subject { create(:user) }

  it { should have_one(:address) }
  it { should accept_nested_attributes_for(:address) }

  it { should have_many(:editorships) }
  it { should have_many(:hotspots).through(:editorships) }
end

