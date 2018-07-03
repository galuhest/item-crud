require 'item'

RSpec.describe Item do
  it "insert item to database" do
  	status, id = Item.create("item N")
  	expect(status).to eq("OK")
  end	

  it "Nth item is exists" do
  	status, id = Item.create("item N")
    expect(Item.get(id)).to eq("item N")
  end

  it "Update Nth item is successful" do
  	status, id = Item.create("item N")
  	expect(Item.update(id, "item N new!")).to eq("OK")
  end

  it "Deleting Nth item is successful" do
  	status, id = Item.create("item N")
  	expect(Item.delete(id)).to eq("OK")
  end
end
