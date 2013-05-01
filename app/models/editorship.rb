class Editorship < ActiveRecord::Base
  belongs_to :user, :validate => true
  belongs_to :hotspot, :validate => true

  validates :user_id, :presence => true, :uniqueness => { :scope => :hotspot_id }
  validates :hotspot_id, :presence => true
end

