# == Schema Information
#
# Table name: hotspots
#
#  id         :integer          not null, primary key
#  name       :string(128)      not null
#  group      :string(128)
#  category   :string(128)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
  validates :name, :format => { with: /^[a-zA-Z0-9_-]+$/, message: "Only letters, numbers, _ and - allowed."}
  validates :name, :category, :presence => true
  validates :name, :category, :group, :length => { :maximum => 128 }
  validates :terms_of_service, :acceptance => true

  has_one :address, :as => :addressable, :dependent => :destroy

  has_many :landings, :dependent => :destroy
  has_many :editorships, :dependent => :destroy
  has_many :users, :through => :editorships

  accepts_nested_attributes_for :address

  def landing
    @landing || landings.first
  end

  def publish! landing
    @landing = landing
  end

  def make_admin!(user)
    editorship = editorships.where(:user_id => user).first
    editorship.admin = true
    editorship.save!
  end

  def remove_editor!(user_id)
    editorship = editorships.where(:user_id => user_id).first
    editorships.destroy editorship
  end

  def admins
    editorships.select(&:admin).map(&:user)
  end
end

