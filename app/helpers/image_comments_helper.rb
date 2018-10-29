# frozen_string_literal: true

# Helper functions for the ImagePosts controller
module ImageCommentsHelper
  def find_image_comment_email(image_comment)
    User.find(image_comment.user_id).email
  end
end
