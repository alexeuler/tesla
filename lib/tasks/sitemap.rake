module Sitemap
  @@host="http://teslablog.ru/"
  @@res=""
  
  def self.res
    @@res
  end

  def self.add_url(path, options={})
    @@res << Sitemap::url do
      Sitemap::loc do
        @@host+path
      end
#options here
    end
  end

  def self.add_blog
    blog_path="blog/posts/"
    add_url(blog_path)
    Blog::Post.all.each do |post|
      add_url(blog_path+post.route)
    end
  end

  def self.add_store
    store_path="store/items/"
    add_url(store_path)
    Store::Item.includes(:store_pages).all.each do |item|
      add_url(store_path+item.route)
      item.store_pages.each do |page|
        add_url(store_path+item.route+"/#{page.route}")
      end
    end
  end
  def self.url
    "<url>\n"+yield+"</url>\n"
  end
  def self.loc
    "<loc>"+yield+"</loc>\n"
  end
  def self.lastmod
    "<lastmod>"+yield+"</lastmod>\n"
  end
  def self.changefreq
    "<changefreq>"+yield+"</changefreq>\n"
  end

end

namespace :sitemap do
  desc "create sitemap"
  task :generate => :environment do
    Sitemap.add_url("")
    Sitemap.add_blog
    Sitemap.add_store
    #Store::Item.includes(:store_pages).all.each do |item|
    puts Sitemap.res
  end
end

