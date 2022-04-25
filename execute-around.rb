def h1
		print "<h1>" 
		print yield 
		print "</h1>" 
end 

# h1 { "Breaking News!" }

def h2 
	print "<h2>"
	print yield
	print "</h2>"
end 

# h2 { "Massive Ruby Discovered" }

def tag(element)
		print "<#{element}>"
		print yield
		print "</#{element}>"
end

tag(:h1) { "Breaking News!" }
tag(:h2) { "Massive Ruby Discovered" }

tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end


puts "PART 2"

def with_debugging
	puts "Got Here!"

	result = yield

	puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end


def with_expectation(expected_value)
	puts "Running test..."


	result = yield
	
	if expected_value == result
		puts "Passed"
	else
		puts "Failed!"
		puts "Expected #{expected_value}, but got #{result}"
	end	
end 

with_expectation(3) { 5 + 2 }