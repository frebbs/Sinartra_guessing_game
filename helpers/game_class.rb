class Game
  attr_accessor :random_number, :win_counter

  def initialize
    @random_number = rand(1..101)
    @win_counter = 0
  end

  def check_user_guess(guess)
    if user_win(guess, @random_number)
      "You have won, try to guess the new number!"
    elsif guess.between?(@random_number, (@random_number + 10))
      "Close, but still too high!"
    elsif guess.between?((@random_number - 10), @random_number)
      "Close, but still too low"
    elsif guess > @random_number
      "That guess was way too high!"
    elsif guess < @random_number && guess > 0
      "That guess was way too low!"
    else
      "Please enter a number to begin the game"
    end
  end

  def user_win(guess, random_num)
    if guess == random_num
      self.win_counter += 1
      @random_number = rand(1..101)
      true
    else
      false
    end
  end
end