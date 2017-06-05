class User < ApplicationRecord
  has_many :dances
  has_many :dance_comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    if privacy1 && username != nil
      username
    else
      first_name
    end
  end

  def ima
    if dancer || caller || musician || band ||choreographer || composer
      true
    end
  end

  def dances?
    dances != []
  end

  def dance_comments?
    dance_comments != []
  end
end
