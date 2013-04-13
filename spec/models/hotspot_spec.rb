require 'spec_helper'

describe Hotspot do
  it { should ensure_inclusion_of(:category).in_array(Hotspot::CATEGORIES) }

  it { should ensure_length_of(:name).is_at_most(128) }
  it { should ensure_length_of(:category).is_at_most(128) }
  it { should ensure_length_of(:group).is_at_most(128) }

  it { should validate_acceptance_of(:terms_of_service) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }

  it 'validates case insensitive uniqueness of name' do
    # The `validates_uniqueness_of` matcher needs an instance in the database
    # to work. If there isn't an instance it creates one with
    # `:validate => false`, but this does not bypass the database constraints.
    create(:hotspot)
    should validate_uniqueness_of(:name).case_insensitive
  end
end

