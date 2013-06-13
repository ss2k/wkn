# == Schema Information
#
# Table name: landings
#
#  id         :integer          not null, primary key
#  hotspot_id :integer          not null
#  title      :string(255)      not null
#  markup     :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Landing < ActiveRecord::Base
  attr_accessible :markup, :title

  belongs_to :hotspot, :validate => true

  validates :title, :presence => true, :uniqueness => {
    :case_sensitive => false,
    :scope => :hotspot_id
  }
end

