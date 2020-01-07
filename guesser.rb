require 'sinatra'
require 'sinatra/reloader'
require './helpers/game_class'

game = Game.new

get '/' do
  user_guess = params["guess"].to_i
  cheat_mode = game.random_number if params['cheat'] == "on" ? true : nil

  erb :index, :locals => {:user_guess => user_guess, :message => game.check_user_guess(user_guess),
                          :win_count => game.win_counter, :cheat_mode => cheat_mode}
end
