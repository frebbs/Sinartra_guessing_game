require 'sinatra'

get '/' do
  rand_num = rand(101)
  "You random number was #{rand_num}"
  #erb :index
end

