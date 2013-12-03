window.startMasonry=(containerSelector,itemSelector, containerWidth)->
                window.msn=new Masonry($(containerSelector)[0], {
                        itemSelector:itemSelector,
                        transitionDuration: 0 
                })
                
                cw=containerWidth || 400
                gap=20
                $(containerSelector).css("left","#{gap/2}px")
                updateColumnWidth=->
                        w=$(containerSelector).width()
                        cols=(w-w%cw)/cw
                        $(containerSelector).find(itemSelector).css('width', "#{w/cols-gap}px")
                        window.msn.options['columnWidth']=w/cols-1
                        window.msn.layout()

                updateColumnWidth()
                
                $(window).resize (e)->
                        updateColumnWidth()
                
                $(window).bind "load", ->
                        updateColumnWidth()
                        
