class ListView extends Backbone.View
  el: 'body'
  events:
    'click button#add': 'addItem'
  initialize: ->
    @counter = 0
    @render()
  render: ->
    @$el
      .append '<button id="add">Add list item</button>'
      .append '<ul></ul>'
  addItem: ->
    $('ul', @el).append "<li>Hello World #{++@counter}</li>"

$ ->
  listView = new ListView()
