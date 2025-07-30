class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_orders, only: [:index]
  before_action :set_order, only: [:show]
  def index
    @orders
  end

  def show
    @order
  end

  def set_orders
    @orders = current_user.orders.includes(:order_items, :products).order(created_at: :desc)
  end

  def set_order
    @order = current_user.orders.find(params[:id])
  end
 
end
