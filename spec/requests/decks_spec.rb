require 'rails_helper'

RSpec.describe "Decks", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    
  end

  describe 'POST /create' do
    it 'creates a new deck' do
      deck_params = {
        deck: {
          title: 'Capitals',
          user_id: user.id
        }
      }

      post '/decks', params: deck_params
      expect(response).to have_http_status(200)

      deck = Deck.first
      expect(deck.title).to eq 'Capitals'
      expect(deck.user_id).to eq user.id
    end
  end

  describe 'PATCH /update' do
    it 'updates a deck' do
      deck_params = {
        deck: {
          title: "Capitals",
          user_id: user.id
        }
      }
      post '/decks', params: deck_params

      deck = Deck.first
      update_deck_params = {
        deck: {
          title: 'BootCamp',
          user_id: user.id
        }
      }

      patch "/decks/#{deck.id}/", params: update_deck_params
      updated_deck = Deck.find(deck.id)

      expect(updated_deck.title).to eq('BootCamp')
    end
  end 

  describe "DELETE /destroy" do
    it 'deletes a deck' do
      deck_params = {
        deck: {
          title: "Capitals",
          user_id: user.id
        }
      }

      post '/decks', params: deck_params

      deck = Deck.first

      delete "/decks/#{deck.id}"

      expect(response).to have_http_status(200)

      decks = Deck.all
      expect(decks).to be_empty
    end
  end
end
