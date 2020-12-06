class ChefsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index, :show]

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
    @chef = Chef.find(params[:id])
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])
    @chef.update(chef_params)
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
end
