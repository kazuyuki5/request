Rails.application.routes.draw do 
  devise_for :users
  root to: "chefs#index"
  resources :chefs do
   resources :request_chefs, only: [:index, :create]
  end
end









# class OrdersController < ApplicationController
#   before_action :authenticate_user!
#   before_action :set_item, only: [:index, :create]

#   def index
#     @order_address = OrderAddress.new
#     if current_user == @item.user || @item.order.present?
#       redirect_to root_path
#     end
#   end

#   def create
#     @order_address = OrderAddress.new(order_params)
#     if @order_address.valid?
#       pay_item
#       @order_address.save
#       redirect_to root_path
#     else
#       render action: :index
#     end
#   end

#   private

#   def order_params
#     params.require(:order_address).permit(:postal_code, :area_id, :city, :address, :building, :phone_number, :order_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
#   end

#   def pay_item
#     Payjp.api_key = ENV['PAYJP_SECRET_KEY']
#     Payjp::Charge.create(
#       amount: @item[:price],
#       card: order_params[:token],
#       currency: 'jpy'
#     )
#   end

#   def set_item
#     @item = Item.find(params[:item_id])
#   end

# end
