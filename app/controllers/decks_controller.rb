class DecksController < ApplicationController

  def index
    decks = Deck.all
    render json: decks
  end

  def create
    deck = Deck.create(deck_params)
    if deck.valid? 
      render json: deck
    else
      render json: deck.errors, status: 422
    end
  end

  def update
    deck = Deck.find(params[:id])
    deck.update(deck_params)
    if deck.valid?
      render json: deck
    else 
      render json: deck.errors, status: 422
    end
  end

  def destroy
    deck = Deck.find(params[:id])
    deck.destroy
    if deck.valid?
      render json: deck
    else
      render json: deck.errors, status: 422
    end
  end

  private
  def deck_params
    params.require(:deck).permit(:title, :user_id)
  end
end
