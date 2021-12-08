class AddPostToTagMaps < ActiveRecord::Migration[5.2]
  def change
    add_reference :tag_maps, :post, foreign_key: true
  end
end
