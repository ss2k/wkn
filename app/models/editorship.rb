# == Schema Information
#
# Table name: editorships
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  hotspot_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin      :boolean          default(FALSE), not null
#

class Editorship < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user, :validate => true
  belongs_to :hotspot, :validate => true

  validates :user_id, :presence => true, :uniqueness => { :scope => :hotspot_id }
  validates :hotspot_id, :presence => true
end

