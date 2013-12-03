window.startMasonry=(containerSelector,itemSelector, containerWidth)->
                window.msn=new Masonry($(containerSelector)[0], {
                        itemSelector:itemSelector,
                        transitionDuration: 0 
                })
                cw=containerWidth || 400
                updateColumnWidth=->
                        w=$(containerSelector).width()
                        gap=20*Math.max($(containerSelector).width()/1000, 1)
                        $(containerSelector).css("left","#{gap/2}px")
                        cols=Math.min((w-w%cw)/cw, $(containerSelector).find($(itemSelector)).length)
                        $(containerSelector).find(itemSelector).css('width', "#{w/cols-gap}px")
                        window.msn.options['columnWidth']=w/cols-1
                        window.msn.layout()
                updateColumnWidth()
                
                $(window).resize (e)->
                        updateColumnWidth()
                
                $(window).bind "load", ->
                        updateColumnWidth()
                        
