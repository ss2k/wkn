class Editorship < ActiveRecord::Base
  belongs_to :user, :validate => true
  belongs_to :editable, :validate => true, :polymorphic => true

  validates :user, :presence => true
  validates :editable, :presence => true
end

