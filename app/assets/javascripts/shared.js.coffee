window.startMasonry=(containerSelector,itemSelector, width)->
        $(window).bind "load", ->
                console.log "{\"itemSelector\":\"#{itemSelector}\", \"columnWidth\":100px}"
                msn=new Masonry($(containerSelector)[0], "{\"itemSelector\":\"#{itemSelector}\"")
