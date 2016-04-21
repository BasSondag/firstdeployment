class Secret < ActiveRecord::Base
  belongs_to :user
  belongs_to :like
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  validates :conten, presence: true



end
