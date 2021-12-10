scores = [83, 71, 92, 64, 98, 87, 75, 69]

high_scores = scores.select { |score| score > 80 }

p high_scores

low_scores = scores.reject { |score| score > 80 }

p low_scores

failing_scores = scores.any? { |score| score < 70 }

puts failing_scores
puts scores.detect { |score| score < 70 }

s = scores.select! { |score| score > 70}

puts s
p scores

scores.reject! { |score| score.even?  }

p scores