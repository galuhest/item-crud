require 'item'
require "spec_helper"

RSpec.describe Item do
	it "insert item to database" do
		status, id = Item.create("item N")
		expect(status).to eq("OK")
	end	

	it "Nth item is exists" do
		status, id = createUser("item N")
		expect(Item.get(id[0])).to eq("item N")
	end

	it "Update Nth item is successful" do
		status, id = createUser("item N")
		expect(Item.update(id[0], "item N new!")).to eq("OK")
	end

	it "Deleting Nth item is successful" do
		status, id = createUser("item N")
		expect(Item.delete(id[0])).to eq("OK")
	end
end
