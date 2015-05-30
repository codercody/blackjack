class window.App extends Backbone.Model
  initialize: ->
    @set 'thisGame', new Game()