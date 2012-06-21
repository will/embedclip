require 'restclient'
class App < Sinatra::Application

  get '/' do
    erb :index
  end

  get "/clip/:id" do
    cors_headers

    RestClient.get("https://postgres.heroku.com/dataclips/#{params[:id]}.json")
  end

  def cors_headers
    headers 'Access-Control-Allow-Origin'  => '*',
            'Access-Control-Allow-Headers' => 'X-Requested-With, x-yobuko-auth-token'
  end
end

