
class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)


# puts flyers.select { |flyer| flyer.miles_flown > 3.000 }
# puts flyers.reject { |flyer| flyer.miles_flown >= 3.000 }
puts flyers.any? { |flyer| flyer.status == :platinum }
puts flyers.detect { |flyer| flyer.status == :bronze }

platinum_flyers, coach_flyers = flyers.partition { |flyer| flyer.status == :platinum }

puts "Platinum"
p platinum_flyers

puts "Coach"
p coach_flyers

friendly_tags = flyers.map {|flyer| "#{flyer.name} #{flyer.status.upcase}"}
puts "Here is the friendly tag "
puts friendly_tags

distances_flown_in_km = flyers.map {|flyer| flyer.miles_flown * 1.6 }

puts "Here are the kilometres flown"
puts distances_flown_in_km

total_distances_flown = flyers.map {|flyer| flyer.miles_flown}.reduce(0, :+)
# or

# total_kms_flown = flyers.reduce(0) { |sum, flyer| sum + (flyer.miles_flown * 1.6) }
# puts "Total km flown: #{total_kms_flown}"


puts "total distances flown"
puts total_distances_flown

kilo_bronze_total = flyers.select { |flyer| flyer.status == :bronze }.reduce(0) {|sum, flyer| sum + (flyer.miles_flown * 1.6)}

# or here's another perfectly-valid solution:
#total_bronze_kms_flown = flyers.select { |f| f.status == :bronze }.map { |f| f.miles_flown * 1.6 }.reduce(:+)

puts kilo_bronze_total

most_miles = flyers.max_by {|flyer| flyer.miles_flown }
puts "Most Miles:"
puts most_miles