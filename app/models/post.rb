class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy

  attachment :image, destroy: false

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 20 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
