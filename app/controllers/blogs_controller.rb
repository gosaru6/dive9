class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :edit, :update, :destroy]

 def index
   @blogs = Blog.all
 end

 def show
 end

 def edit
 end

 def update
   if @blog.update(blog_params)
     redirect_to blogs_path, notice: 'ブログの編集が完了しました'
   else
     render :edit
   end
 end

 def destroy
   @blog.destroy
   redirect_to blogs_path, notice: 'ブログの削除が完了しました'
 end

 def new
   @blog = Blog.new
 end

 def create
   @blog = current_user.blogs.build(blog_params)
   if @blog.save
     redirect_to blogs_path, notice: '新規登録処理が完了しました'
   else
     render :new
   end
 end

 def confirm
   @blog = Blog.new(blog_params)
   render :new if @blog.invalid?
 end

 private

   def blog_params
     params.require(:blog).permit(:title, :content)
   end

   def set_blog
     @blog = Blog.find(params[:id])
   end
end
