require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)["inventory"]
    expect(items.count).to eq(3)
  end

  # it "create an item" do
  #   item_params = {name: "Vibranium shield", description: "Captain America's tool of choice.", unit_price: 2}

  #   post '/api/v1/items', params: {item: item_params}

  #   expect(response).to be_success

  #   item = Item.last

  #   expect(item.name).to eq(item_params[:name])
  # end
end