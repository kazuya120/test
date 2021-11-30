class FavoritesController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.new(blog_id: @blog.id)
    favorite.save
    @blogs = Blog.all.sort{ |a, b| b.favorite_users.count <=> a.favorite_users.count }
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.find_by(blog_id: @blog.id)
    favorite.destroy
    @blogs = Blog.all.sort{ |a, b| b.favorite_users.count <=> a.favorite_users.count }
  end
end
