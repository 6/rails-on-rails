class App.Views.BaseView extends Backbone.View
  initialize: (@template_obj) =>
    console.p "BaseView -> initialize", @template_obj
    # initialize template only after $ ready
    @template = JST[@template] if @template?

  render: ->
    console.p "BaseView -> render", @el, @template_obj
    $(@el).html @template(@template_obj) if @el? and @template?
    @

  destroy: ->
    $(@el).removeData().unbind() if @el?
    @

  set_parent: (parent) ->
    @parent = parent
    @
