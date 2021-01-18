dictionary = File.open('words.txt')
dictionary_array = dictionary.readlines
dictionary_array.shuffle!

# Intro text, wait for user to type 'start'
puts "\n<<< Welcome to my hangman app >>>\n\n"
print "Please enter your name: "
name = gets
print "Welcome #{name.strip}!!! (Hint: Each word is programming related)"
puts "Type \"start\" to begin a new game\n"
turn = 0
rematch = nil
print "> "
user_word = gets.chomp.downcase.strip
until user_word == "start"
print "> "
user_word = gets.chomp.downcase.strip
end

puts "Getting your word ready..\n\n"

# Loop the game until the user types 'quit'
until rematch == "quit"

  # Get a word, put the chars into an array, make an array of letters remaining
  dictionary_array.shuffle!
  word = dictionary_array[13]
  word_array = word.chars.to_a
  letters_left = dictionary_array[13].chars.to_a
  # Get rid of \r\n
  word_array.delete_at(word_array.length-1)
  letters_left.delete_at(letters_left.length-1)
letters_left.delete_at(letters_left.length-1)

# Initialize Alphabet and chances
alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", 
"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
chances = 5 
  
  # If it is the first turn OR they choose to rematch
  if rematch == "new" || turn == 0
  word_array.each do |x|
    print "_ "
  end
  puts "\n\n"

  puts "Getting your word ready\n"
  puts "chances Remaining: #{chances}"
  puts "Letters Remaining: "

  alphabet.each do |x|
    print "#{x} "
  end
  puts "\n\n"

  puts "Guess a letter: "
  print "> "
  guess = gets.chomp.upcase.strip

  until alphabet.include?(guess) == true
    puts "WRONG"
    puts "GUESS AGAIN"
    print "> "
    guess = gets.chomp.upcase.strip
  end

  # After the first guess, only break if chances are 0 or no letters remaining
  until chances == 0 || letters_left == []
  
    if word_array.include?(guess.downcase) == true
    
      puts "\n\n"
      alphabet.delete(guess)  
      letters_left.delete(guess.downcase)
    
      if letters_left == []
        break
      end
  
      word_array.each do |x|
        if alphabet.include?(x.upcase) == true
          print "_ "
        else 
          print "#{x.upcase} "
        end
      end
    
      puts "\n\n"
      puts "chances Remaining: #{chances}"
      puts "Letters Remaining: "

      alphabet.each do |x|
        print "#{x} "
      end
      puts "\n\n"
  
      puts "Guess a letter: "
      print "> "
      guess = gets.chomp.upcase.strip
   
      until alphabet.include?(guess) == true
         puts "WRONG"
         puts "TRY AGAIN"
         print "> "
         guess = gets.chomp.upcase.strip
      end
  
    elsif chances > 1
      chances -= 1
  
      puts "next letter\n\n"
      alphabet.delete(guess)
  
      word_array.each do |x|
        if alphabet.include?(x.upcase) == true
          print "_ "
        else 
          print "#{x.upcase} "
        end
      end
    
      puts "\n\n"
      puts "Chances Remaining: #{chances}"
      puts "Letters Remaining: "

      alphabet.each do |x|
        print "#{x} "
      end
      puts "\n\n"
  
      puts "Guess a letter: "
      print "> "
      guess = gets.chomp.upcase.strip
   
      until alphabet.include?(guess) == true
         puts "wrong"
         puts "Please guess from the available letters"
         print "> "
         guess = gets.chomp.upcase.strip
      end
  
    else 
      chances -= 1
      puts "LOSER!\n"
      puts "Your word was#{word_array.to_s.upcase} Better luck next time"
    end  
  
  end # of first guess until

  if letters_left == [0]
    puts "You are correct! Good Job. #{word_array.to_s.upcase}" 
  end   

  turn += 1
  puts "Type \"new\" for a new game, type \"quit\" to exit"
  print "> "
  rematch = gets.chomp.downcase.strip
  else
  puts "Please type either \"new\" OR \"quit\""
  end

end 

