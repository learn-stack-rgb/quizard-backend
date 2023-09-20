require 'rails_helper'

RSpec.describe "Decks", type: :request do
  let(:user) {User.create(
    email: 'Deck1@deck1.mail',
    password: 'password'
  )}
 
  
  
  
  describe "GET /index" do
    it "gets a list of decks" do
      deck = user.decks.create(
        title: 'Deck1'
      )

      get '/decks'

      deck = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(deck.first['title']). to eq('Deck1')
    end
  end
end
