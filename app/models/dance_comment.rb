class DanceComment < ApplicationRecord
  belongs_to :user
  belongs_to :dance
  belongs_to :comment_type

  validates :comment, presence: true
  validates :comment_type_id, presence: true
  validates :dance_id, presence: true
  validates :user_id, presence: true
end
