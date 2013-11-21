class AddLikesToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :likes, :integer, default: 0
  end
end
