class Dance < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :formation_id, presence: true
  validates :meter_id, presence: true
  validates :direction, presence: true
end
