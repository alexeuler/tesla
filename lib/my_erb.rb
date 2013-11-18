class MyERB< Erubis::Eruby
        def add_preamble(src)
          @newline_pending = 0
          src << "@output_buffer1 = ActionView::OutputBuffer.new;"
        end

        def add_text(src, text)
          return if text.empty?

          if text == "\n"
            @newline_pending += 1
          else
            src << "@output_buffer1.safe_append='"
            src << "\n" * @newline_pending if @newline_pending > 0
            src << escape_text(text)
            src << "';"

            @newline_pending = 0
          end
        end

        # Erubis toggles <%= and <%== behavior when escaping is enabled.
        # We override to always treat <%== as escaped.
        def add_expr(src, code, indicator)
          case indicator
          when '=='
            add_expr_escaped(src, code)
          else
            super
          end
        end

        BLOCK_EXPR = /\s+(do|\{)(\s*\|[^|]*\|)?\s*\Z/

        def add_expr_literal(src, code)
          flush_newline_if_pending(src)
          if code =~ BLOCK_EXPR
            src << '@output_buffer1.append= ' << code
          else
            src << '@output_buffer1.append=(' << code << ');'
          end
        end

        def add_expr_escaped(src, code)
          flush_newline_if_pending(src)
          if code =~ BLOCK_EXPR
            src << "@output_buffer1.safe_append= " << code
          else
            src << "@output_buffer1.safe_append=(" << code << ");"
          end
        end

        def add_stmt(src, code)
          flush_newline_if_pending(src)
          super
        end

        def add_postamble(src)
          flush_newline_if_pending(src)
          debugger
          src << '@output_buffer1.to_s'
          
        end

        def flush_newline_if_pending(src)
          if @newline_pending > 0
            src << "@output_buffer1.safe_append='#{"\n" * @newline_pending}';"
            @newline_pending = 0
          end
        end

end
