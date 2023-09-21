require 'rails_helper'

RSpec.describe Card, type: :model do
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

    it('validates question attribute of a card') do 
      card = deck.cards.create(
        answer: "Sacramento", 
        seen: false,
        correct: false,
        deck_id: deck.id
      )
      expect(card.errors['question']).to_not be_empty
    end

    it('validates answer attribute of a card') do 
      card = deck.cards.create(
        question: "What is the Capital of California?", 
        seen: false,
        correct: false,
        deck_id: deck.id
      )
      expect(card.errors['answer']).to_not be_empty
    end

    it('validates seen attribute of a card') do 
      card = deck.cards.create(
        question: "What is the Capital of California?", 
        answer: "Sacramento", 
        correct: false,
        deck_id: deck.id
      )
      expect(card.errors['seen']).to_not be_empty
    end

    it('validates correct attribute of a card') do 
      card = deck.cards.create(
        question: "What is the Capital of California?", 
        answer: "Sacramento", 
        seen: false,
        deck_id: deck.id
      )
      expect(card.errors['correct']).to_not be_empty
    end

end
