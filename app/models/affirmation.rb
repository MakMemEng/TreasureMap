class Affirmation < ApplicationRecord
  belongs_to :user
  attachment :image
end
