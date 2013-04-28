class Editorship < ActiveRecord::Base
  attr_accessible :landing_id, :user_id

  belongs_to :user, :validate => true
  belongs_to :editable, :validate => true, :polymorphic => true

  validates :user, :presence => true
  validates :editable, :presence => true
end

