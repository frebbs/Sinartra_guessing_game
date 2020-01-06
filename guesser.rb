require 'sinatra'
require 'sinatra/reloader'
require './helpers/check_user_guess_helpers'

rand_num = rand(1..101)
player_wins = 0

get '/' do
  user_guess = params["guess"].to_i
  game_message = check_user_guess(user_guess, rand_num)
  cheat_mode = nil

  if params["cheat"]
    cheat_mode = rand_num
  end
  
  if user_win(user_guess, rand_num)
    player_wins += 1
    rand_num = rand(1..100)
  end



  erb :index, :locals => {:user_guess => user_guess, :message => game_message, :win_count => player_wins,
                          :cheat_mode => cheat_mode}
  #throw params.inspect
end

