class ListView extends Backbone.View
  el: 'body'
  constructor: ->
    super()
    @render()
  render: ->
    @$el.append '<ul><li>Hello World</li></ul>'

$ ->
  listView = new ListView()
