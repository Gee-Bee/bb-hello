class Item extends Backbone.Model
  defaults:
    part1: 'Hello'
    part2: 'World'

class List extends Backbone.Collection
  model: Item

class ItemView extends Backbone.View
  tagName: 'li'
  render: ->
    @$el.html "#{@model.get 'part1'} #{@model.get 'part2'}"
    @

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
  addItem: ->
    item = new Item()
    item.set 'part2', "#{item.get 'part2'} #{@list.length+1}"
    @list.add item
  appendItem: (item) =>
    itemView = new ItemView
      model: item
    $('ul', @el).append itemView.render().el

$ ->
  listView = new ListView()
