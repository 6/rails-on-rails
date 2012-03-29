class App.Views.Example extends App.Views.BaseView
  el: '#bb-test'
  template: 'example'

  events:
    'click #test-click': 'test_click'

  test_click: (e) ->
    e.preventDefault()
    alert "Clicked!"
