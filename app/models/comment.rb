class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :affirmation
  validates :comment, presence: true, length: {maximun: 200 }
end
