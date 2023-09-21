class Card < ApplicationRecord
  belongs_to :deck
  validates :question, :answer, :seen, :correct, :deck_id, presence: true
end
