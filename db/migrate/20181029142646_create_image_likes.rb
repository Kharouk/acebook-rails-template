# frozen_string_literal: true

class CreateImageLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :image_likes do |t|
      t.references :image_post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
