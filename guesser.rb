require 'sinatra'
require 'sinatra/reloader'

rand_num = rand(101)
player_wins = 0

get '/' do
  user_guess = params["guess"].to_i


  if user_guess == rand_num
    message = "You have won, try to guess the new number!"
    player_wins += 1
    rand_num = rand(101)
  elsif user_guess > rand_num
    message = "That guess was too high!"
  elsif user_guess < rand_num && user_guess > 0
    message = "That guess was too low!"
  else
    message = "Please enter a number to begin the game"
  end

  erb :index, :locals => {:rand_num => rand_num, :user_guess => user_guess, :message => message,
                          :win_count => player_wins}
  #throw params.inspect
end

