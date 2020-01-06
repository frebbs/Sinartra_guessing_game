require 'sinatra'
require 'sinatra/reloader'

rand_num = rand(101)

get '/' do
  "Your random number was #{rand_num}"
  #erb :index
end

