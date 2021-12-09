class RemoveBookFromTagMaps < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tag_maps, :book, foreign_key: true
  end
end
