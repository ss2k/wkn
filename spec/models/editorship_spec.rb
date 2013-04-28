require 'spec_helper'

describe Editorship do
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:editable_id).of_type(:integer) }
  it { should have_db_column(:editable_type).of_type(:string) }
  it { should have_db_index([:user_id, :editable_id, :editable_type]).unique(true) }

  it { should belong_to(:user).validate }
  it { should belong_to(:editable).validate }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:editable) }
end

