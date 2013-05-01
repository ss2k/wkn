require 'spec_helper'

describe Editorship do
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:hotspot_id).of_type(:integer) }
  it { should have_db_index([:user_id, :hotspot_id]).unique(true) }

  it { should belong_to(:user).validate }
  it { should belong_to(:hotspot).validate }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:hotspot_id) }

  it 'Validates unique user scoped to hotspot' do
    create(:editorship)
    should validate_uniqueness_of(:user_id).scoped_to(:hotspot_id)
  end
end

