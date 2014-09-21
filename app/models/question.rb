class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1}
  validates :description, presence: true, length: { minimum: 1}
end
