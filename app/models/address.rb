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

class Address < ActiveRecord::Base
  attr_accessible :address1, :address2, :addressable_id, :addressable_type, :city, :country, :postal_code, :state

  validates :address1, :city, :state, :country, :postal_code, :presence => true

  belongs_to :addressable, :polymorphic => true
end

