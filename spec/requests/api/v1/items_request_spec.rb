require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)["inventory"]
    expect(items.count).to eq(3)
  end

  it "Create an item" do
    item_params = {name: "Vibranium shield", description: "Round, star spangled shield.", unit_price: 2}

    post '/api/v1/items', params: {item: item_params}

    expect(response).to be_success

    item = Item.last

    expect(item.name).to eq(item_params[:name])
  end

  it "Can update an item" do
    id = create(:item).id
    previous_name = Item.last.name
    item_params = {name: "Sceptor" }

    put "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find_by(id: id)

    expect(response).to be_success
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Sceptor")
  end

  it "Can show an individual item" do
    id = create(:item).id
    item_params = {name: "Tesseract"}

    get "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find_by(id: id)

    expect(response).to be_success
  end

end