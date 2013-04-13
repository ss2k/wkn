class Address < ActiveRecord::Base
  attr_accessible :address1, :address2, :addressable_id, :addressable_type, :city, :country, :postal_code, :state

  validates :address1, :city, :state, :country, :postal_code, :presence => true

  belongs_to :addressable, :polymorphic => true
end

