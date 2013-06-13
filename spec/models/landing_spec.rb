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

require 'spec_helper'

describe Landing do
  it { should have_db_column(:title) }
  it { should have_db_column(:markup) }
  it { should have_db_column(:hotspot_id) }
  it { should have_db_index([:hotspot_id, :title]).unique(true) }

  it { should belong_to(:hotspot).validate }
  it { should validate_presence_of(:title) }

  it 'validates case insensitive uniqueness of title scoped to hotspot_id' do
    create(:landing)
    should validate_uniqueness_of(:title).scoped_to(:hotspot_id).case_insensitive
  end
end

