require 'sinatra'
require 'sinatra/reloader'
require './helpers/check_user_guess_helpers'

rand_num = rand(1..101)
player_wins = 0

get '/' do
  user_guess = params["guess"].to_i
  game_message = check_user_guess(user_guess, rand_num)
  if user_win(user_guess, rand_num)
    player_wins += 1
    rand_num = rand(1..100)
  end



  erb :index, :locals => {:user_guess => user_guess, :message => game_message, :win_count => player_wins}
  #throw params.inspect
end

