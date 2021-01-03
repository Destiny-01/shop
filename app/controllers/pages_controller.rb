class PagesController < ApplicationController
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
