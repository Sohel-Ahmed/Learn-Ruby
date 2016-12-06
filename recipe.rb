ingredients = {}
ingredients[:avocados] = 4
ingredients[:jalapenoes] = 3
puts ingredients[:avocados]

puts ingredients[:salt].nil?

Recipe = Struct.new(:ingredients,:method)

recipe = Recipe.new

recipe.ingredients = ingredients

recipe.method = ["Peel / slice Avacados", "Cut jalapenoes in small pieces"]

puts recipe

puts "Ingredients"
recipe.ingredients.each do |key,value|
	puts "*#{key}: #{value}"
end

puts "\nMethod"
recipe.method.each_with_index do |step,index|
	puts "#{index+1}. #{step}"
end
