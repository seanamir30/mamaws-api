class Api::V1::ItemsController < ApplicationController
  before_action :set_api_v1_item, only: %i[ show update destroy ]
  # GET /api/v1/items
  def index
    @api_v1_items = Api::V1::Item.all

    render json: @api_v1_items
  end

  # GET /api/v1/items/1
  def show
    render json: @api_v1_item
  end

  # POST /api/v1/items
  def create
    @api_v1_item = Api::V1::Item.new(api_v1_item_params)

    if @api_v1_item.save
      render json: @api_v1_item, status: :created, location: @api_v1_item
    else
      render json: @api_v1_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/items/1
  def update
    if @api_v1_item.update(api_v1_item_params)
      render json: @api_v1_item
    else
      render json: @api_v1_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/items/1
  def destroy
    @api_v1_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_item
      @api_v1_item = Api::V1::Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_item_params
      params.require(:api_v1_item).permit(:title, :description, :price, :quantity, :sold)
    end
end
