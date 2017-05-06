class Question < ApplicationRecord
  belongs_to :user
  validates :text , length: {maximum: 255}, presence: true
  validates :user, presence: true
end
