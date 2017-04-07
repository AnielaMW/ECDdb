class User < ApplicationRecord
  has_many :dances
  has_many :dance_comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def dances?
    self.dances != []
  end

  def dance_comments?
    self.dance_comments != []
  end
end
