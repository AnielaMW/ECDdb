class DanceDirection < ApplicationRecord
  belongs_to :dance

  validates :sequence, presence: true
  validates :direction, presence: true
  validates :dance_id, presence: true
end
