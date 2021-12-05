class Post < ApplicationRecord

  belongs_to :user
  attachment :image, destroy: false

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 20 }
end
