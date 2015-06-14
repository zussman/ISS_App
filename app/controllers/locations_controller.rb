class LocationsController < ApplicationController

  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
  end

  def find_location
    @location = Location.find(params[:id])
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create location_params

    if @location.save
      redirect_to @location
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: "Successfully deleted locations."
  end

  private
  def location_params
    params.require(:location).permit(:location_name, :address, :city, :country)
  end

end
