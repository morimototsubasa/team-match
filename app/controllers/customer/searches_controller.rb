class Customer::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    genre_ids = Genre.where(genre: params[:genre]).ids
    city_ids = City.where(city: params[:city]).ids
    @recruit = Recruit.where(genre_id: genre_ids, city_id: city_ids)
    @customer = Customer.all
    # @genre = params[:genre]
    # @city = params[:city]

    render template: 'customer/recruits/index'
  end
end
