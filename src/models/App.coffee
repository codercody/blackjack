# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerBust', false
    @get('playerHand').on('bust', => 
      @set 'playerBust', true
      console.log('bust'))


    # @get('playerHand').on 'bust', => console.log('bust')