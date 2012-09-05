require 'rubygems'
require 'sinatra'
require 'coffee-script'

set :haml, :format => :html5

get '/' do
  haml :index
end

get '/styles.css' do
  sass :styles
end

get '/js/nav.js' do
  content_type 'text/javascript'
  coffee :nav
end
