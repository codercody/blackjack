class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    # @model.set('bust'): -> ".hit-button display:none"

  initialize: ->
    @model.get('playerHand').on 'bust', => console.log(this.$el.find('.player-hand-container').prepend(
      $('<h3>LOSER!</h3>')))
    @model.get('playerHand').on 'bust', => console.log(this.$el.find('.hit-button').attr('disabled', 'disabled'))
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

