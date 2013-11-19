class MyERB< ActionView::Template::Handlers::Erubis
  #This class is required for correct form_for behavior
  #This is the same as Erubis class in rails (rails / actionview / lib / action_view / template / handlers / erb.rb)
  #The only thing that's changed is commented out output_buffer definition
  
        def add_preamble(src)
          @newline_pending = 0
          #src << "@output_buffer = output_buffer || ActionView::OutputBuffer.new;"
        end

end
