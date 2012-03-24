$ ->
  init_bootstrap()

init_bootstrap = ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
