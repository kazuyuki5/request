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


