class Blog::Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :route, use: [:finders]

  def cut_page
    /<cut\/>/.match(page)
    cut_page=$` || page
    cut_page.gsub!(/<%(.*)content_for(.*):title(.*)%>/, "")
    cut_page.gsub!(/<%(.*)content_for(.*):description(.*)%>/, "")
    cut_page
  end

  def uncut_page
    page.gsub("<cut/>", "")
  end

end
