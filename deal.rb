def deal
		puts "Start" 
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  random_face = faces.sample
  random_suit = suits.sample 
  
	score = yield random_face, random_suit

	puts "You scored a #{score}!"
	puts "End"
end

deal do |face, suit| 
	puts "Dealt a #{face} of #{suit}"

	#this part below must go last if we want it to appear as the score 
	face.length + suit.length
end