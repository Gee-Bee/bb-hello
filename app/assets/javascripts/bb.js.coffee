class Item extends Backbone.Model
  defaults:
    part1: 'Hello'
    part2: 'World'

class List extends Backbone.Collection
  model: Item

class ItemView extends Backbone.View
  tagName: 'li'
  events:
    'click .swap': 'swap'
    'click .delete': 'delete'
  initialize: ->
    @model.on 'change', @render
    @model.on 'destroy', @unrender
  render: =>
    @$el.html "<span>#{@model.get 'part1'} #{@model.get 'part2'}</span>&nbsp;<span class='swap' style='color: blue; cursor: pointer'>[swap]</span>&nbsp;<span class='delete' style='color: red; cursor: pointer'>[delete]</span>"
    @
  unrender: =>
    @$el.remove()
  swap: ->
    swapped =
      part1: @model.get 'part2'
      part2: @model.get 'part1'
    @model.set swapped
  delete: ->
    @model.destroy()


class ListView extends Backbone.View
  el: 'body'
  events:
    'click button#add': 'addItem'
  initialize: ->
    @counter = 0
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
    item.set 'part2', "#{item.get 'part2'} #{++@counter}"
    @list.add item
  appendItem: (item) =>
    itemView = new ItemView
      model: item
    $('ul', @el).append itemView.render().el

$ ->
  window.listView = new ListView()
