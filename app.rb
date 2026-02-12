require "sinatra"

get "/" do
  @title = "index"
  @name = "Haruki"
  erb :index
end
