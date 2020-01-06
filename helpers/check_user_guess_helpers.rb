def user_win(guess, random_num)
  if guess == random_num
    true
  else
    false
  end
end

def check_user_guess(guess, random_num)
  if user_win(guess, random_num)
    "You have won, try to guess the new number!"
  elsif guess.between?(random_num, (random_num + 10))
    "Close, but still too high!"
  elsif guess.between?((random_num - 10), random_num)
    "Close, but still too low"
  elsif guess > random_num
    "That guess was way too high!"
  elsif guess < random_num && guess > 0
    "That guess was way too low!"
  else
    "Please enter a number to begin the game"
  end
end



def cheat_mode_helper(x)
  if x
    true
  else
    false
  end
end
