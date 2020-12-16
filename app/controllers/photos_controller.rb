class PhotosController < ApplicationController

  def index
    @photos = Photo.new
  end
end
