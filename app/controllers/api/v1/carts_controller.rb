class Api::V1::CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_cart, only: %i[ show update destroy ]

  # GET /api/v1/carts
  def index
    @api_v1_carts = Api::V1::Cart.all

    render json: @api_v1_carts
  end

  # GET /api/v1/carts/1
  def show
    render json: @api_v1_cart
  end

  # POST /api/v1/carts
  def create
    @api_v1_cart = Api::V1::Cart.new(api_v1_cart_params)

    if @api_v1_cart.save
      render json: @api_v1_cart, status: :created, location: @api_v1_cart
    else
      render json: @api_v1_cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/carts/1
  def update
    if @api_v1_cart.update(api_v1_cart_params)
      render json: @api_v1_cart
    else
      render json: @api_v1_cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/carts/1
  def destroy
    @api_v1_cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_cart
      @api_v1_cart = Api::V1::Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_cart_params
      params.require(:api_v1_cart).permit(:quantity, :user_id, :api_v1_item_id)
    end
end
