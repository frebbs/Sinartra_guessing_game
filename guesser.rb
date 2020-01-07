require 'sinatra'
require 'sinatra/reloader'
require './helpers/game_class'

#rand_num = rand(1..101)
#

game = Game.new
rand_num = game.random_number
player_wins = 0

get '/' do
  user_guess = params["guess"].to_i
  game_message = game.check_user_guess(user_guess, rand_num)
  cheat_mode = game.random_number if params['cheat'] == "on" ? true : nil
  if game.user_win(user_guess, rand_num)
    player_wins += 1
    rand_num = rand(1..101)
    puts rand_num
  end

  erb :index, :locals => {:user_guess => user_guess, :message => game_message, :win_count => player_wins,
                          :cheat_mode => cheat_mode}
end
