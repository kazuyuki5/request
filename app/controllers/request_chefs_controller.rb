class RequestChefsController < ApplicationController
  before_action :authenticate_user!
before_action :set_item, only: [:index, :create]

def index
  @req_add = ReqAdd.new
    if current_user == @chef.user 
    redirect_to root_path
    end
end

def create

  @req_add = ReqAdd.new(request_chef_params)
  if @req_add.valid?
    pay_item
    @req_add.save
    redirect_to root_path
  else
    render action: :index
  end
end

private

def request_chef_params
  params.require(:req_add).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :request_chef_id).merge(chef_id: params[:chef_id], user_id: current_user.id, token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @chef[:price],
    card: request_chef_params[:token],
    currency: 'jpy'
  )
end

def set_item
  @chef = Chef.find(params[:chef_id])
end
end


# def create
#   @order_address = OrderAddress.new(order_params)
#   if @order_address.valid?
#     pay_item
#     @order_address.save
#     redirect_to root_path
#   else
#     render action: :index
#   end
# end

# private

# def order_params
#   params.require(:order_address).permit(:postal_code, :area_id, :city, :address, :building, :phone_number, :order_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
# end
