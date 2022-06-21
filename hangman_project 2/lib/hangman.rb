class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word 
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |c, i| indices << i if c == char}
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print "That has already been attemped"
      return false
    end

    @attempted_chars << char
    
    if self.get_matching_indices(char).empty?
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, self.get_matching_indices(char))
    end
    return true
  end

  def ask_user_for_guess
    print "Enter a char: "
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN\n"
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE\n"
      return true
    end
    return false
  end

  def game_over?
    if self.win? || self.lose?
      print @secret_word + "\n"
      return true
    end
    return false
  end
end
