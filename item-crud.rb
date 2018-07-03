require 'sinatra'
require 'json'
configure do
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| 
    require File.basename(lib, '.*') 
  }
end
# Program ini adalah aplikasi webapp untuk
# library Item.
get '/' do
	"Hello World!"
end

get '/item/:id' do |id|
	content_type :json
	names = Item.get(id)
	response = {:status => 'OK', :name => names}
	response.to_json
end

post '/item' do
	content_type :json
	name = params[:name]
	status, id = Item.create(name)
	response = {:status => status, :id => id[0]}
	response.to_json
end
 
post '/item/:id' do |id|
	content_type :json
	status = Item.update(id, params['name'])
	response = {:status => status}
	response.to_json
end

post '/item/:id/delete' do |id|
	content_type :json
	status = Item.delete(id)
	response = {:status => status}
	response.to_json
end