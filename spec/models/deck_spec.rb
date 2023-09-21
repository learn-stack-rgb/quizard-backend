require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validates title' do
    deck = user.decks.create()
    expect(deck.errors[:title]).to include("can't be blank")
  end
end
