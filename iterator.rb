def three_times
	puts "start"
		1.upto 3 do |count|
			yield count
		end 
	puts "end"
end

three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end 