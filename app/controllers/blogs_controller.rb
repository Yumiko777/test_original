class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.latest.includes(:user)
  end

  def show
    @comments = @blog.comments.includes(:user)
    @comment = @blog.comments.build
  end

  def new
    @blog = Blog.new
  end

  def edit
    redirect_to blogs_path, alert: '不正なアクセスです!' if @blog.user_id != current_user.id
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    respond_to do |format|
      if @blog.save
        NoticeMailer.sendmail_blog(@blog).deliver_later
        format.html { redirect_to @blog, notice: '作成しました！' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: '更新しました！' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: '削除しました！' }
      format.json { head :no_content }
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
