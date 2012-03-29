window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    # add some controllers to ignore BB on
    return if $("html").data("controller") in []
    console.p "App.init()"
    App.router = new App.Routers.AppRouter()
    # if enable pushState, can't use hash, since that's the fallback
    Backbone.history.start pushState:no
