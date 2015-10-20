class Event < ActiveRecord::Base
  belongs_to :user
  has_many :responses, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :user_id, presence: true

  def in_past?
    (self.all_day ? self.end_datetime.end_of_day : self.end_datetime) < Time.now
  end
end
