class RequestChefController < ApplicationController

  def index
 @requests = RequestChef.new
  end
end
