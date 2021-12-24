class SearchesController < ApplicationController
  def search
    search = params[:search]
    @word = params[:word]
    @tag = Tag.search(search, @word)
    p @tag
    @posts = Post.left_joins(:tag_maps).where(:tag_maps => {:tag_id => @tag.ids})
    p @posts
  end
end
