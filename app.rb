require 'restclient'
class App < Sinatra::Application

  get '/' do
    erb :index
  end

  get '/:id.js' do
    host = ENV['HOST'] || "http://localhost:3000"
    @css_url = "#{host}/css/embed.css"
    @clip_id = params[:id]
    #@json = RestClient.get("https://postgres.heroku.com/dataclips/#{params[:id]}.json")
    @json = "[{\"name\":\"Laetitia Darche\",\"description\":\"Miss Mauritius 2010, contestant at Miss Universe 2011\",\"birth_date\":\"1991-06-22\"},{\"name\":\"Katie Jarvis\",\"description\":\"Actress\",\"birth_date\":\"1991-06-22\"},{\"name\":\"Vlad Rusu\",\"description\":\"Footballer\",\"birth_date\":\"1990-06-22\"},{\"name\":\"Sebastian Jung\",\"description\":\"footballer\",\"birth_date\":\"1990-06-22\"},{\"name\":\"Diego Oliveira De Queiroz\",\"description\":\"Footballer\",\"birth_date\":\"1990-06-22\"},{\"name\":\"Erik Follestad Johansen\",\"description\":\"Norwegian ice hockey defenceman\",\"birth_date\":\"1989-06-22\"},{\"name\":\"Manuel Daffara\",\"description\":\"Italian footballer\",\"birth_date\":\"1989-06-22\"},{\"name\":\"Jeshua Anderson\",\"description\":\"American sprinter, who specialises in the 400 meters and 400 m hurdles.\",\"birth_date\":\"1989-06-22\"},{\"name\":\"Ryan Searle\",\"description\":\"Baseball player\",\"birth_date\":\"1989-06-22\"},{\"name\":\"Vladimirs Bespalovs\",\"description\":\"footballer\",\"birth_date\":\"1988-06-22\"}]"
    erb :clipjs
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

