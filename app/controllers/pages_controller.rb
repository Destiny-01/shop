class PagesController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:index, :_store, :shop]

  def index
    @products = Product.all
  end

  def _store
    @products = Product.all
  end

  def shop
    @products = Product.all
  end
end
