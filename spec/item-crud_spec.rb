require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe "Item Webapp" do
	it "should allow accessing the home page" do
		get '/'
		expect(last_response).to be_ok
	end

	it "returns user's name" do
		get '/item/1'
		response =  response_body
		# puts response
		expect(response["status"]).to eq "OK"
		expect(response["name"]).to eq "item N"
	end

	it "create new user" do
		post '/item'
		response = response_body
		expect(response["status"]).to eq "OK"
	end

	it "change user's name" do
		post '/item/1',{"name":"item N new!"}
		response = response_body
		expect(response["status"]).to eq "OK"
	end

	it "deletes a user" do
		post '/item/1/delete'
		response = response_body
		expect(response["status"]).to eq "OK"
	end

  def response_body
    JSON.parse(last_response.body)
  end
end

