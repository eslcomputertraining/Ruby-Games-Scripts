puts "\n\nWelcome to the game Hangman!\n\n"
puts "\n----HOW TO WIN!----\n\n"
puts "The object of the game is to guess the other player's mystery word."
puts "\n***Be wise, you only get 6 guesses (2 legs, 2 arms, 1 torso, 1 oops).***"
puts "\n----RULES----\n\n"
puts "Player 1 gets to input their mystery word." 
puts "Then Player 2 gets to ask 1 question in which Player 1 inputs a 'yes' or 'no'.***"
puts "After Player 1 confirms the answer with the 'yes' or 'no',"
puts "then Player 2 gets to make a guess."
puts "If the Player 2 makes the right guess, then their man is saved."
puts "If not, then this process is repeated 6 times."
puts "The game loops again to ask the users if they want to play again." 
puts "If you type 'yes', then the games gives Player 1 a chance to be Player 2." 
puts "The new Player 1 gets to input their mystery word and the game starts again." 
puts "The game stops when the players stop inputting 'yes' at the end of each game when" 
puts "the computer asks them if they would like to play another round."
puts "\nGood luck!\n"

puts "\n\nPress <Enter> to continue...\n\n"

# this is the start of the loop

def game 
  loop do


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
		