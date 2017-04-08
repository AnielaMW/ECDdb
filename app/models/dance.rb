class Dance < ApplicationRecord
  belongs_to :user
  belongs_to :meter
  belongs_to :formation
  has_many :dance_comments

  validates :title, presence: true
  validates :formation_id, presence: true
  validates :meter_id, presence: true
  validates :direction, presence: true

  def creator?(cu)
    cu && user_id == cu.id
  end
end
