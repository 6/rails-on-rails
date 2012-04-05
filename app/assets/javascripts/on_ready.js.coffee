$ ->
  clean_up_fb()
  init_bootstrap()
  App.init()

clean_up_fb = ->
  window.location.hash = "" if window.location.hash is "#_=_"

init_bootstrap = ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
