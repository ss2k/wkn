require 'spec_helper'

describe Address do
  it { should validate_presence_of(:address1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:postal_code) }

  it { should belong_to(:addressable) }
end

