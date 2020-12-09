class ChefsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  

  def index
    @chefs = Chef.order("created_at DESC")
  end

  def new
    @chef = Chef.new
  end

  def create 
    @chef = Chef.new(chef_params)
    if @chef.valid?
      @chef.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @chef.user_id
      redirect_to root_path
    end
  end

  def update
    if @chef.update(chef_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @chef.user_id
     @chef.destroy
     redirect_to root_path
    else
     redirect_to  root_path
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:image,:nickname,:profile,:area,:price,:category_id,:fee_time_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @chef = Chef.find(params[:id])
  end

end





# before_action :authenticate_user!
# before_action :set_item, only: [:index, :create]

# def index
#   @req_add = ReqAdd.new
#     if current_user == @chef.user 
#     redirect_to root_path
#     end
# end

# def create
  
#   @req_add = ReqAdd.new(request_chef_params)
#   if @req_add.valid?
#     pay_item
#     @req_add.save
#     redirect_to root_path
#   else
#     render action: :index
#   end
# end

# private

# def request_chef_params
#   params.require(:req_add).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :request_chef_id).merge(chef_id: params[:chef_id], user_id: current_user.id, token: params[:token])
# end

# def pay_item
#   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
#   Payjp::Charge.create(
#     amount: @chef[:price],
#     card: request_chef_params[:token],
#     currency: 'jpy'
#   )
# end

# def set_item
#   @chef = Chef.find(params[:chef_id])
# end
# end