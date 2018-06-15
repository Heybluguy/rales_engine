class Api::V1::ItemsController < ApplicationController
  def index
    render json: {inventory: Item.all}
  end

  def create
    render json: Item.create(item_params)
  end

  def update
    render json: Item.update(params[:id], item_params)
  end

  def show
    render json: {inventory: Item.show(params[:id])}
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :unit_price)
    end
end