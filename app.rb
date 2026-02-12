require "sinatra"

get "/" do
  rbfiles = File.join("**", "*.rb")
  erbfiles = File.join("**", "*.erb")
  @filenames = Dir.glob([rbfiles, erbfiles])

  @title = "index"
  @name = "Haruki"
  erb :index
end
