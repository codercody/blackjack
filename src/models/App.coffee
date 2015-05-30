# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @set 'playerBust', false
    @get('playerHand').on('bust', @dealerWins, @)
                      .on('stand', @dealerPlays, @)
    @get('dealerHand').on('bust', @playerWins, @)
                      .on('stand', @compareScores, @)   
  
  dealerPlays: ->
    hand = @get('dealerHand')
    hand.at(0).flip()
    hand.hit() while hand.minScore() < 17 || hand.minScore() < 17
    if hand.minScore() <= 21 then hand.stand()
    # some logic here needed?

  compareScores: ->
    if @get('playerHand').scores()[1] > 21 then playerScore = @get('playerHand').scores()[0]
    else playerScore = @get('playerHand').scores()[1]
    if @get('dealerHand').scores()[1] > 21 then dealerScore = @get('dealerHand').scores()[0]
    else dealerScore = @get('dealerHand').scores()[1]

    if playerScore == dealerScore then @tied()
    else if playerScore > dealerScore
      @playerWins()
    else @dealerWins()

  playerWins: ->
    console.log('Woot woot!')
    @gameOver()

  dealerWins: -> 
    console.log('Boo hoo')
    @gameOver()

  tied: ->
    console.log('Tied!')
    @gameOver()

  gameOver: ->
    console.log('Good game!')