require 'rubygems'
require 'sinatra'

set :haml, :format => :html5

get '/' do
  haml :index
end

get '/styles.css' do
  sass :styles
end
