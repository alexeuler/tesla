class Blog::Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :route, use: [:finders]

  def cut_page
    /<cut\/>/.match(page)
    $` || page
  end

  def uncut_page
    page.gsub("<cut/>", "")
  end

end
