require 'HTTParty'
require 'will_paginate/array'

class LocationsController < ApplicationController
  before_action :get_passes, only: [:show]
  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.paginate(page: params[:page], per_page: 10)
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
  end

  def find_location
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])
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
    if @location.update(location_params)
      redirect_to @location
    else
      render 'edit'
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path, notice: "Successfully deleted locations."
  end

  def get_passes
    @location = Location.find(params[:id])
    @iss_passes = HTTParty.get("http://api.open-notify.org/iss-pass.json?lat=#{@location.latitude}&lon=#{@location.longitude}&n=50", :verify => false)["response"]
    @iss_passes = @iss_passes.paginate(page: params[:page], per_page: 10)
  end

  private
  def location_params
    params.require(:location).permit(:location_name, :address, :city, :country, users_attributes: [:id, :email])
  end

end
