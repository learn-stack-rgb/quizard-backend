user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

states_deck = user1.decks.create(title: "States")
bootcamp_deck = user2.decks.create(title: "Bootcamp")
driving_deck = user1.decks.create(title: "Driving")

states_q = [
	{
		question: "What is the Capital of California?",
		answer: "Sacramento",
		seen: false,
		correct: false,
	},
	{
		question: "What is the Capital of Illinois?",
		answer: "Springfield",
		seen: false,
		correct: false,
	},
	{
		question: "What is the Capital of Texas?",
		answer: "Austin",
		seen: false,
		correct: false,
	}
]

bootcamp_q = [
	{
		question: "What is the DOM?",
		answer: "Document Object Model",
		seen: false,
		correct: false,
	},
	{
		question: "How do you create a single line comment in JavaScript?",
		answer: 'With two forward slashes "//"',
		seen: false,
		correct: false,
	},
	{
		question: "What method convert a string into uppercase characters?",
		answer: ".toUpperCase()",
		seen: false,
		correct: false,
	}
]

driving_q = [
	{
		question: "When is it appropriate for a driver to use his vehicle’s horn?",
		answer: "Only when necessary to avoid collisions or to try and alert other drivers of your presence",
		seen: false,
		correct: false,
	},
	{
		question: "When should you assume that other driver’s will give you the right of way?",
		answer: "Never",
		seen: false,
		correct: false,
	},
	{
		question: "You should __ your following distance when you encounter other drivers who may be potentially dangerous",
		answer: "increase",
		seen: false,
		correct: false,
	}
]

states_q.each do |card|
  states_deck.cards.create(card)
  p "created: #{card[:question]}"
end

bootcamp_q.each do |card|
  bootcamp_deck.cards.create(card)
  p "created: #{card[:question]}"
end

driving_q.each do |card|
  driving_deck.cards.create(card)
  p "created: #{card[:question]}"
end