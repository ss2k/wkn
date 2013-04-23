class Hotspot < ActiveRecord::Base
  CATEGORIES = [
    'Arts & Entertainment',
    'Home & Garden',
    'Automotive',
    'Industry & Agriculture',
    'Business & Professional Services',
    'Legal & Financial',
    'Clothing & Accessories',
    'Media & Communications',
    'Community & Government',
    'Personal Care & Services',
    'Computers & Electronics',
    'Real Estate',
    'Construction & Contractors',
    'Shopping',
    'Education',
    'Sports & Recreation',
    'Food & Dining',
    'Travel & Transportation',
    'Health & Medicine',
  ]

  attr_accessible :category, :group, :name, :terms_of_service, :address_attributes

  validates :category, :inclusion => { :in => CATEGORIES }
  validates :name, :uniqueness => { :case_sensitive => false }
  validates :name, :category, :presence => true
  validates :name, :category, :group, :length => { :maximum => 128 }
  validates :terms_of_service, :acceptance => true

  belongs_to :user

  has_one :address, :as => :addressable, :dependent => :destroy

  has_many :landings

  accepts_nested_attributes_for :address
end

