require 'restclient'
require 'json'
class App < Sinatra::Application

  get '/' do
    erb :index
  end

  get '/:id.js' do
    host = ENV['HOST'] || "http://localhost:3000"
    @css_url = "#{host}/css/embed.css"
    @clip_id = params[:id]
    @json = RestClient.get("https://postgres.heroku.com/dataclips/#{params[:id]}.json")

    content_type 'application/javascript'
    erb :clipjs
  end

  get '/:id.md' do
    table = JSON.parse RestClient.get("https://postgres.heroku.com/dataclips/#{params[:id]}.json")

    lines = table.map{|row| row.values }
    lines.unshift table.first.keys.map {|row| "-----" }
    lines.unshift table.first.keys
    markdown = lines.map {|row| "| #{row.join(' | ')} |"}.join("\n")

    footer = "\n[This Dataclip](https://postgres.heroku.com/dataclips/#{params[:id]}) brought to you by [Heroku Postgres](https://postgres.heroku.com)."

    content_type 'text'
    markdown + footer
  end
end

