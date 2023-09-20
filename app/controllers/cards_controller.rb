class CardsController < ApplicationController
  
  def index
    deck = Deck.find(params[:deck_id])
    cards = deck.cards.all
    render json: cards
  end

  def create
    deck = Deck.find(params[:deck_id])
    card = deck.cards.create(card_params)
    if card.valid?
      render json: card
    else 
      render json: card.errors, status: 422
    end
  end

  def update
    deck = Deck.find(params[:deck_id])
    card = deck.cards.find(params[:id])
    card.update(card_params)
    if card.valid?
      render json: card
    else
      render json: card.errors, status: 422
    end
  end

  def destroy
    deck = Deck.find(params[:deck_id])
    card = deck.cards.find(params[:id])
    card.destroy
    if card.valid?
      render json: card
    else
      render json: card.errors, status: 422
    end
  end
  
  private
  def card_params
    params.require(:card).permit(:question, :answer, :seen, :correct, :deck_id)
  end
end
