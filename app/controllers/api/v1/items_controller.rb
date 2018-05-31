class Api::V1::ItemsController < ApplicationController
  def index
    render json: {inventory: Item.all}
  end

end