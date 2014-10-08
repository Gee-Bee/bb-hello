class ListView
  el: 'body'
  constructor: ->
    @render()
  render: ->
    $(@el).append '<ul><li>Hello World</li></ul>'

$ ->
  window.listView = new ListView()
