class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    # @on 'hit', @trigger 'bust' if @minScore() > 21

  hit: ->
    @add(@deck.pop())
    # if @scores()[0] > 21 then @trigger('bust'), @
    # @trigger 'hit'
    @trigger 'bust' if @scores()[0] > 21

  stand: ->
    @trigger 'stand'

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  # score: ->
  #   @minScore()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

    # hasAce = @reduce (memo, card) ->
    #   memo or card.get('value') is 1
    # , 0

    # score = @reduce (score, card) ->
    #   score + if card.get 'revealed' then card.get 'value' else 0
    # , 0

    
    # need to flesh this out?