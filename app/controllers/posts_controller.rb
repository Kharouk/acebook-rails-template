# frozen_string_literal: true

# Logic for the Posts routes, allows us to create and index posts currently.
class PostsController < ApplicationController
  include PostsHelper
  before_action :authenticate_user!

  def new
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_back(fallback_location: root_url)
  end

  def index
    redirect_to root_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.profile_message.positive?
      redirect_to '/' + params[:post][:profile_id]
    else
      redirect_to posts_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: root_url)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.build
    @user = User.find(current_user.id)
  rescue ActiveRecord::RecordNotFound
    render file: "#{Rails.root}/public/post404.html", layout: false,
           status: :not_found
  end

  private

  def post_params
    output = params.require(:post).permit(:message, :profile_message)
    output[:user_id] = current_user.id
    output
  end
end
