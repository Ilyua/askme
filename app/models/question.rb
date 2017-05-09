class Question < ApplicationRecord
  belongs_to :user
  belongs_to :question_user, class_name: 'User',optional: true
  validates :text , length: {maximum: 255}, presence: true
  validates :user, presence: true
end
