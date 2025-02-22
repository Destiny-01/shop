class OrdersController < ApplicationController

    include CurrentCart
    before_action :set_cart, only: [:new, :create]
    before_action :set_order, only: [:show, :edit, :destroy ]

    def index
        @orders = Order.all
    end

    def new
        @order = Order.new    
        if @cart.product_items.empty?
            redirect_to shop_url, notice: "Your Cart Is Empty"
            return
        end
    end

    def create
        @order = Order.new(order_params)
        @order.add_product_items_from_cart(@cart)
        if @order.save
            Cart.destroy(session)[:cart_id]
            session[:cart_id] = nil
            redirect_to root_url, notice: 'Thank You for your Order, hope to see you soon'
        else
            render :new, notice: 'Please Check Your Form'
        end
    end

    def show
    end

    def destroy
        @order.destroy
        redirect_to root_url, notice: 'Order was successsfully destroyed'
    end

    private

    def set_order
        @order = Order.find(params[:id])
    end

    def order_params
        params.require(:order).permit(:name, :email, :address, :city, :country)
    end