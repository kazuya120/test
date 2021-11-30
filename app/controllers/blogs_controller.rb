class BlogsController < ApplicationController
  before_action :correct_user, only:[:edit, :update]

  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
    @newblog = Blog.new
  end

  def index
    @blogs = Blog.all.sort{ |a, b| b.favorite_users.count <=> a.favorite_users.count }
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog), notice: "You have created blog successfully."
    else
      @blogs = Blog.all
      render 'index'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: "You have updated blog successfully."
    else
      render "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :image_id)
  end

  

end
