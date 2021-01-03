class CartsController < ApplicationController

    before_action :set_cart, only: [:show, :destroy]
    rescue_from ActiveRecord: :RecordNotFound with: :invalid_cart

    def new
        @cart = Cart.new
    end

    def show
    end

    def destroy
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil
        redirect_to shop_path, notice: "Your Cart Is Empty"
    end

    private

    def set_cart
        params[:cart]
    end

    def invalid_cart
        logger_error "You are trying to accessan Invalid Cart"
        redirect_to shop_path, notice: "Invalid Cart"
    end
end
