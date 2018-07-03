require 'sinatra'
configure do
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| 
    require File.basename(lib, '.*') 
  }
end

get '/' do
	"Hello World!"
end

get '/item/:id' do |id|
	Item.get(id)
end

post '/item' do
	name = params["name"]
	Item.create(name)
end
 
post '/item/:id' do |id|
	Item.update(id, params['name'])
end