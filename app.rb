require "sinatra"
require "i18n"
require "faker"
require_relative "lib/search"

set :bind, "0.0.0.0"

before do
  @restaurants = Search.new(params).results
end

get "/" do
  erb :index, layout: true
end

post "/search" do
  response.headers['Content-Type'] = 'text/vnd.turbo-stream.html'

  erb :search, layout: false
end
