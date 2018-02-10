class FavoriteController < ApplicationController

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blog_path(favorite.blog_id)
  end

  def destroy
    favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
    redirect_to blog_path(favorite.blog_id)
  end

end
