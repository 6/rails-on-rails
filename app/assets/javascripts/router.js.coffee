class App.Routers.AppRouter extends Backbone.Router
  routes:
    "": "index"

  index: ->
    console.p "Router -> index"
    @_set_view new App.Views.Example(title: "Hello from hamlc").render()

  _set_view: (view) =>
    console.p "Destroy", @view, "_set_view", view
    @view.destroy() if @view? and @view.destroy?
    @view = view
