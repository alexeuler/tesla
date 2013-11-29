module Sitemap
  @@host="http://teslablog.ru/"
  @@res=""
  @@level=0
  
  def self.res
    @@res
  end

  def self.add(str)
    @@res << Array.new(@@level*2, " ").join << str << "\n"
  end

  def self.add_header
    self.add '<?xml version="1.0" encoding="UTF-8"?>'
  end

  def self.add_url(path, options={})
    Sitemap::url do
      Sitemap::loc do
        self.add @@host+path
      end
      options.each do |key, value|
        Sitemap.send(key) do
          self.add value
        end
      end
    end
  end

  def self.add_blog
    blog_path="blog/posts/"
    posts=Blog::Post.all
    add_url blog_path,lastmod: posts.map(&:updated_at).max.strftime("%Y-%m-%d"), changefreq: 'weekly'
    posts.each do |post|
      add_url(blog_path+post.route, lastmod: post.updated_at.strftime("%Y-%m-%d"))
    end
  end

  def self.add_store
    store_path="store/items/"
    add_url(store_path, lastmod: Store::Page.maximum(:updated_at).strftime("%Y-%m-%d"))
    Store::Item.includes(:store_pages).all.each do |item|
      add_url(store_path+item.route, lastmod: item.store_pages.map(&:updated_at).max.strftime("%Y-%m-%d"))
      item.store_pages.each do |page|
        add_url(store_path+item.route+"/#{page.route}", lastmod: page.updated_at.strftime("%Y-%m-%d"))
      end
    end
  end

  def self.method_missing(method_sym, *arguments, &block)
    self.add "<#{method_sym}#{arguments.join}>"
    @@level=@@level+1
    block.call
    @@level=@@level-1
    self.add "<\\#{method_sym}>"
  end
end

namespace :sitemap do
  desc "create sitemap"
  task :generate => :environment do
    Sitemap.add_header
    Sitemap.urlset(' xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"') do
      Sitemap.add_url("", lastmod: Blog::Post.maximum(:updated_at).strftime("%Y-%m-%d"), changefreq:"weekly")
      Sitemap.add_blog
      Sitemap.add_store
    end
    File.open("#{Rails.root}/public/sitemap.xml", 'w') { |file| file.write(Sitemap.res) }
  end
end

