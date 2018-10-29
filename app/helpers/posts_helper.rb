
module PostsHelper
  def get_posts_by_user(user_id)
    Post.where(user_id: user_id)
  end
end
