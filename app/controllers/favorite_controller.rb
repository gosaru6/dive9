class FavoriteController < ApplicationController
  respond_to :js

  def create
    if logged_in?
      @blog = Blog.find(params[:favorite][:blog_id])
      current_user.favorite!(@blog)
      respond_with @blog
    else
      respond_with @blog
    end
  end

  def destroy
    @blog = Favorite.find(params[:id]).blog
    current_user.unfavorite!(@blog)
    respond_with @blog
  end

end
