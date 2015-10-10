class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :user_id, presence: true
end
