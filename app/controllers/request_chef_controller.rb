class RequestChefController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @request_chef = RequestChef.new
      if current_user == @chef.user 
      redirect_to root_path
      end
  end

  def create
    @request_chef = RequestChef.new(request_chef_params)
    if @request_chef.valid?
      pay_item
      @request_chef.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def request_chef_params
    params.require(:request_chef).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :chef_id).merge(chef_id: params[:chef_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @chef = Chef.find(params[:chef_id])
  end
end
