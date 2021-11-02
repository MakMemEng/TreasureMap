class Affirmation < ApplicationRecord
  belongs_to :user
  has_many  :comments,  dependent: :destroy
  attachment :image
  validates :title,     presence: true, length: { maximum: 30 }
  validates :body,      presence: true, length: { maximum: 400 }
  validates :image,     presence: true
  validates :image_id,  presence: true

  validates :user_id,   presence: true

end
