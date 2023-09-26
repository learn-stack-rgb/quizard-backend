class Card < ApplicationRecord
  belongs_to :deck
  validates :question, :answer, :deck_id, presence: true
end
