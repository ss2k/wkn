# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  address1         :string(255)      not null
#  address2         :string(255)
#  city             :string(255)      not null
#  state            :string(255)      not null
#  country          :string(255)      not null
#  postal_code      :string(255)      not null
#  addressable_id   :integer          not null
#  addressable_type :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe Address do
  it { should validate_presence_of(:address1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:postal_code) }

  it { should belong_to(:addressable) }
end

