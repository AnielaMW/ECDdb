class CommentType < ApplicationRecord
  # has_many :comments

  validates :name, presence: true
  validates :description, presence: true
end
