module ApplicationHelper
  def image_tag_zen(link, options={})
    cls=options[:class]||""
    alt=options[:alt]||""
    "<img src=\'assets/images/#{link}\' class=\'#{cls}\' alt=\'#{alt}\'>".html_safe
  end
end
