cards = ["Jack", "Queen", "King", "Ace", "Joker"]

cards.reverse_each.each do |card|
	card.upcase

	puts "#{card} - #{card.length}"
end

scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

scores.each do |player, score|
	puts "#{player} scored a #{score}!"

end