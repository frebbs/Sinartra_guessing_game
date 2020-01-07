require 'sinatra'
require 'sinatra/reloader'
require './helpers/game_class'

rand_num = rand(1..101)
player_wins = 0
game = Game.new

get '/' do
  user_guess = params["guess"].to_i
  game_message = game.check_user_guess(user_guess, rand_num)
  cheat_mode = nil

  if params["cheat"]
    cheat_mode = rand_num
  end

  if game.user_win(user_guess, rand_num)
    player_wins += 1
    rand_num = rand(1..100)
  end

  erb :index, :locals => {:user_guess => user_guess, :message => game_message, :win_count => player_wins,
                          :cheat_mode => cheat_mode}

end

get '/cats' do
  erb :cats
end