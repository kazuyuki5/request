class ChefsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
    @chefs = Chef.new
  end

  def new
    @chef = Chef.new
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
