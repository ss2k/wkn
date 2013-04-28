class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :address_attributes

  has_many :editorships
  has_many :hotspots, :through => :editorships, :source => :editable, :source_type => 'Hotspot'
  has_many :landings, :through => :editorships, :source => :editable, :source_type => 'Landing'
  has_one :address, :as => :addressable

  accepts_nested_attributes_for :address, :reject_if => :all_blank
end

