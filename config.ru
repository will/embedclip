require 'bundler'
Bundler.require
require './app'

use Rack::CommonLogger
use Rack::Static, :urls => ["/css", "/images", "/js"], :root => "public"

run App.new

