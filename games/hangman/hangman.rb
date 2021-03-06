unless ARGV[0] and File.exists?(ARGV[0])
	puts "\n\nUsage is hangman_words.rb <word.files>\n\n"
	exit 
end

words = File.readlines(ARGV[0])
mystery_word = words[rand(words.size)].chomp
solution = Array.new(mystery_word.length, "_")
guessed = []
steps = 6

while steps > 0 
	puts <<EOM
	"\n\n\nYou have #{steps} guesses left."
	Guessed: "#{guessed}"
	Word: "#{solution}"
EOM
	print "Enter a letter or guess the word: "
	guess = $stdin.gets.downcase.chomp

	if guess == mystery_word.to_s
		puts "You have been pardoned!"
		exit 
	end

	if guessed.include?(guess)
		puts "You have already guessed that letter. Try again..."
		next
	elsif mystery_word.include?(guess)
		puts "The letter was found."
		mystery_word.each_index do |x|
			if mystery_word[x] == guess
				solution[x] = guess
			end
		end
	else 
		puts "Sorry, that letter is not correct."
	end
	guessed << guess 
	steps -= 1
end
puts "\n\n\nOh No! You were hanged!"
puts "The word was: #{mystery_word}."
		