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
end
