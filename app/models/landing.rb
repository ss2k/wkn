class Landing < ActiveRecord::Base
  attr_accessible :markup, :title

  belongs_to :hotspot, :validate => true

  has_many :editorships, :as => :editable
  has_many :users, :through => :editorships

  validates :title, :presence => true, :uniqueness => {
    :case_sensitive => false,
    :scope => :hotspot_id
  }
end
