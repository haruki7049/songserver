require "sinatra"

get "/" do
  content_type :json
  response = {
    body: "welcome to sinatra",
  }
  response.to_json
end
