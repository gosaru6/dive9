class BlogsController < ApplicationController
  before_action:set_blog, only:[:show, :edit, :update, :destroy]

 #HOME、一覧画面を表示
 def index
   @blogs = Blog.all
 end

 #詳細画面
 def show
 end

 #編集画面
 def edit
 end

 #編集処理
 def update
   if @blogs.update(blog_params)
     #成功の場合
     redirect_to blogs_path, notice: 'ブログの編集が完了しました'
   else
     #失敗の場合
     render 'edit'
   end
 end

 #削除処理
 def destroy
   @blogs.destroy
   redirect_to blogs_path, notice: 'ブログの削除が完了しました'
 end

 #新規作成画面
 def new
   if params[:back]
     @blogs = Blog.new(blog_params)
   else
     @blogs = Blog.new
   end
 end

 #新規作成処理
 def create
   @blogs = Blog.new(blog_params)

   if @blogs.save
     #成功の場合

     #一覧画面へリダイレクト
     redirect_to blogs_path, notice:'新規登録処理が完了しました'
   else
     #失敗の場合

     #新規作成画面を再描画
     render 'new'
   end
 end

 def confirm
   @blogs = Blog.new(blog_params)
   render:new if @blogs.invalid?
 end

 private

 #ストロングパラメータ
 def blog_params
   params.require(:blog).permit(:title, :content, :user_id)
 end

 #ブログ情報のセット
 def set_blog
   @blogs = Blog.find(params[:id])
 end
end
