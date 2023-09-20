require 'rails_helper'

RSpec.describe "Cards", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  let(:deck) { user.decks.create(
      title: 'Capitals',
      user_id: user.id
    )
  }

  describe "GET /index" do
    
  end

  describe 'POST /create' do
    it 'creates a new card' do
      card_params = {
        card: {
          question: "What is the Capital of California?", 
          answer: "Sacramento", 
          seen: false,
          correct: false,
          deck_id: deck.id
        }
      }

      post "/decks/#{deck.id}/cards", params: card_params
      expect(response).to have_http_status(200)

      card = Card.first
      expect(card.question).to eq("What is the Capital of California?")
      expect(card.answer).to eq("Sacramento")
      expect(card.deck_id).to eq(deck.id)

    end
  end

  describe "PATCH /update" do
    it 'Updates a card' do
      card_params = {
        card: {
          question: "What is the Capital of California?",
          answer: "San Diego",
          seen: false,
          correct: false,
          deck_id: deck.id
        }
      }

      post "/decks/#{deck.id}/cards", params: card_params

      card = Card.first
      update_card_params = {
        card: {
          question: "What is the Capital of California?",
          answer: "Sacramento",
          seen: false,
          correct: false,
          deck_id: deck.id
        }
      }

      patch "/decks/#{deck.id}/cards/#{card.id}", params: update_card_params

      updated_card = Card.find(card.id)
      expect(updated_card.answer).to eq('Sacramento')
    end
  end

  describe "DELETE /destroy" do
    it 'deletes a card from a deck' do
      card_params = {
        card: {
          question: 'What is the Capital of California?', 
          answer: "Sacramento", 
          seen: false,
          correct: false,
          deck_id: deck.id
        }
      }

      post "/decks/#{deck.id}/cards", params: card_params

      card = deck.cards.first

      delete "/decks/#{deck.id}/cards/#{card.id}"

      expect(response).to have_http_status(200)

      cards = deck.cards.all

      expect(cards).to be_empty
    end
  end

end
