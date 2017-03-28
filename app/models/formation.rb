class Formation < ApplicationRecord
  has_many :dances

  validates :name, presence: true
  validates :description, presence: true
end
