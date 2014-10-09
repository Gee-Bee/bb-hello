class Item extends Backbone.Model
  defaults:
    part1: 'Hello'
    part2: 'World'

class List extends Backbone.Collection
  model: Item

class ListView extends Backbone.View
  el: 'body'
  events:
    'click button#add': 'addItem'
  initialize: ->
    @list = new List()
    @list.on 'add', @appendItem
    @render()
  render: ->
    @$el
      .append '<button id="add">Add list item</button>'
      .append '<ul></ul>'
    @appendItem item for item in @list.models
  addItem: -> # add item to collection
    item = new Item()
    item.set 'part2', "#{item.get 'part2'} #{@list.length+1}"
    @list.add item
  appendItem: (item) => # append item to listview
    $('ul', @el).append "<li>#{item.get 'part1'} #{item.get 'part2'}</li>"

$ ->
  listView = new ListView()
