class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :header
      t.string :route
      t.string :tag
      t.text :page

      t.timestamps
    end
  end
end
