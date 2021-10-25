# frozen_string_literal: true
class Hangman
  DICTIONARY = %w[cat dog bootcamp pizza]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.size, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  # @return [Array]
  attr_reader :guess_word

  # @return [Array]
  attr_reader :attempted_chars

  attr_reader :remaining_incorrect_guesses

  # @param [String] char
  def already_attempted?(char)
    return true if attempted_chars.include?(char)

    false
  end

  # @param [String] char
  # @return [Array]
  def get_matching_indices(char)
    result = []
    @secret_word.each_char.with_index { |chara, i| result << i if char == chara }
    result
  end

  # @param [String] char
  # @param [Array] indices
  def fill_indices(char, indices)
    indices.each do |i|
      @guess_word[i] = char
    end
    guess_word
  end

  # @param [String] char
  def try_guess(char)
    if already_attempted?(char)
      p "that #{char} has already been attempted"
      false
    else
      @attempted_chars.push(char)
      if get_matching_indices(char) != []
        fill_indices(char, get_matching_indices(char))
      else
        @remaining_incorrect_guesses -= 1
      end
      true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if guess_word.join == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if remaining_incorrect_guesses <= 0
      p 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      p "The word is '#{@secret_word}'"
      true
    else
      false
    end
  end
end
