class Admin::CitiesController < ApplicationController
  
  def new
  end

  def index
    @city = City.new
    @cities = City.all
  end
  
  def create
    city = City.new(city_params)
    city.save
    redirect_to admin_cities_path
  end
  
  private

  def city_params
    params.require(:city).permit(:city)
  end
end
