class Mood < ApplicationRecord
  has_many :dances, through: :dances_mood

  validates :name, presence: true, uniqueness: true
end
