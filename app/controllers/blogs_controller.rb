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
   if @blogs.update(blog_params)
     redirect_to blogs_path, notice: 'ブログの編集が完了しました'
   else
     render 'edit'
   end
 end

 def destroy
   @blogs.destroy
   redirect_to blogs_path, notice: 'ブログの削除が完了しました'
 end

 def new
   if params[:back]
     @blogs = Blog.new(blog_params)
   else
     @blogs = Blog.new
   end
 end

 def create
   @blogs = Blog.new(blog_params)

   if @blogs.save
     redirect_to blogs_path, notice: '新規登録処理が完了しました'
   else
     render 'new'
   end
 end

 def confirm
   @blogs = Blog.new(blog_params)
   render :new if @blogs.invalid?
 end

 private

   def blog_params
     params.require(:blog).permit(:title, :content, :user_id)
   end

   def set_blog
     @blogs = Blog.find(params[:id])
   end
end
