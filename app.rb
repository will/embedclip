require 'restclient'
class App < Sinatra::Application

  get '/' do
    erb :index
  end

  get '/:id.js' do
    host = ENV['HOST'] || "http://localhost:3000"
    @css_url = "#{host}/css/embed.css"
    @clip_id = params[:id]
    @json = RestClient.get("https://postgres.heroku.com/dataclips/#{params[:id]}.json")
    erb :clipjs
  end
end

