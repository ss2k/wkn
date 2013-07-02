class Ticket < ActiveRecord::Base
  attr_accessible :category, :description, :resolved, :subject, :user_id

  belongs_to :user
end
