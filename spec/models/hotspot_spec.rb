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

require 'spec_helper'

describe Hotspot do
  it { should ensure_inclusion_of(:category).in_array(Hotspot::CATEGORIES) }

  it { should ensure_length_of(:name).is_at_most(128) }
  it { should ensure_length_of(:category).is_at_most(128) }
  it { should ensure_length_of(:group).is_at_most(128) }

  it { should have_many(:landings) }

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

  it { should have_one(:address).dependent(:destroy) }

  it { should accept_nested_attributes_for(:address) }

  it { should have_many(:editorships) }
  it { should have_many(:users).through(:editorships) }

  describe '#landing' do
    subject { create(:hotspot) }

    describe 'Hotspot with one landing' do
      let!(:only_landing) { subject.landings.create :title => 'abcd' }
      its(:landing) { should eq only_landing }
    end

    describe 'With a sibling landing page' do
      let!(:first) { subject.landings.create :title => 'efgh' }
      let!(:second) { subject.landings.create :title => 'efgh' }
      let!(:third) { subject.landings.create :title => 'ijkl' }
      its(:landing) { should eq first }

      describe 'When a landing page is explicitly published' do
        before { subject.publish!(third) }
        its(:landing) { should eq third }
      end
    end
  end
end

