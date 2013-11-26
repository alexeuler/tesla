require 'my_erb'
module ApplicationHelper
  def render_from_text(text, context=nil)
    begin
      MyERB.new(text).result(context)
      "" # Returns empty string as MyERB writes the result directly into view output buffer
    rescue Exception => e
      "<p>Error</p>".html_safe
    end
  end
end
