require 'pry'

def welcome
  # puts out a welcome message here!
  puts " Welcome to the Star Wars!"
end

def get_character_from_user
  puts "Please enter a Character Name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.strip
  character.downcase
end


# welcome()
# get_character_from_user()
