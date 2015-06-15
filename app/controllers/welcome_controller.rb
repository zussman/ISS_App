require 'httparty'

class WelcomeController < ApplicationController
  before_action :get_location

  def get_location
    iss_data = HTTParty.get("https://api.wheretheiss.at/v1/satellites/25544", :verify => false)
    mi_per_km = 0.621371
    @name = iss_data["name"]
    @id = iss_data["id"]
    @latitude = iss_data["latitude"]
    @longitude = iss_data["longitude"]
    @altitude = (iss_data["altitude"] * mi_per_km).round(2)
    @velocity = (iss_data["velocity"] * mi_per_km).round(2)
    @visibility = iss_data["visibility"]
    @footprint = iss_data["footprint"]
    @timestamp = Time.at(iss_data["timestamp"].to_i)
    @time = @timestamp.strftime('%H:%M:%S %p %Z')
    @daynum = iss_data["daynum"]
    @solar_lat = iss_data["solar_lat"]
    @solar_lon = iss_data["solar_lon"]
    @units = iss_data["units"]
    @iss_location = "#{iss_data['latitude']},#{iss_data['longitude']}"
  end

  def index
  end

  def about
  end
  
end
