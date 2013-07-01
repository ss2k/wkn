class Ticket < ActiveRecord::Base
  attr_accessible :category, :description, :resolved, :subject, :user_id
end
