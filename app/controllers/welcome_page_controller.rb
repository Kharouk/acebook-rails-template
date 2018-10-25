# frozen_string_literal: true

# Runs the logic for the welcome page.
class WelcomePageController < ApplicationController
  def welcome
    if user_signed_in?
      @posts = Post.all
      render 'timeline'
    else
      render 'sign_in'
    end
  end

  def sign_in; end

  def timeline
    if user_signed_in?
      @user = current_user.username
    else
      redirect_to posts_url
    end
  end
end
