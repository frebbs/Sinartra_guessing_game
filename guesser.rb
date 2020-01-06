require 'sinatra'
require 'sinatra/reloader'
require './helpers/check_user_guess'

rand_num = rand(1..101)
player_wins = 0

get '/' do
  user_guess = params["guess"].to_i
  game_message = check_user_guess(user_guess)

  if user_guess == rand_num
    message = "You have won, try to guess the new number!"
    player_wins += 1
    rand_num = rand(101)
  elsif user_guess.between?(rand_num, rand_num + 10)
    message = "Close, but still too high!"
  elsif user_guess.between?(rand_num - 10, rand_num)
    message = "Close, but still too low"
  elsif user_guess > rand_num
    message = "That guess was way too high!"
  elsif user_guess < rand_num && user_guess > 0
    message = "That guess was way too low!"
  else
    message = "Please enter a number to begin the game"
  end

  erb :index, :locals => {:rand_num => rand_num, :user_guess => user_guess, :message => game_message,
                          :win_count => player_wins}
  #throw params.inspect
end

