class Response < ActiveRecord::Base
  attr_accessible :answer, :ticket_id, :user_id

  belongs_to :user
  belongs_to :ticket
end
