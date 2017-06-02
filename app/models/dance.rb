class Dance < ApplicationRecord
  belongs_to :user
  belongs_to :meter
  belongs_to :formation
  belongs_to :tempo, optional: true
  belongs_to :key, optional: true
  belongs_to :dance_level, optional: true
  has_many :dance_comments
  has_many :dance_directions
  has_many :dance_moods
  has_many :moods, through: :dance_moods

  validates :title, presence: true, uniqueness: true
  validates :formation_id, presence: true
  validates :meter_id, presence: true

  def creator?(cu)
    cu && cu.id == user_id
  end
end
