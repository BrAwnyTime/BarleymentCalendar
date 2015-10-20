class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :response, presence: true 
  validates :user_id, presence: true
  validates :event_id, presence: true
end
