window.console ?= {}

console.p = (args...) ->
  console.log args... if $("html").data("debug") is "yes"
