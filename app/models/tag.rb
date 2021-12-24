class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy
  has_many :posts, through: :tag_maps

  def self.search(search, word)
    if search == "partial_match"
      @tag = Tag.where("tag_name LIKE?", "%#{word}%")
    elsif search == "perfect_match"
      @tag = Tag.where(tag_name: "#{word}")
    else
      @tag = Tag.all
    end
  end
end
