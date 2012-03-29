$ ->
  init_bootstrap()
  App.init()

init_bootstrap = ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
