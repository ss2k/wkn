class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :address_attributes

  has_many :hotspots

  has_one :address, :as => :addressable

  accepts_nested_attributes_for :address, :reject_if => :all_blank
end

