class Ticket < ActiveRecord::Base
  attr_accessible :category, :description, :resolved, :subject, :user_id

  belongs_to :user
  has_many :responses

  private
  def created
    self.created_at("%m/%d/%Y")
  end
end
