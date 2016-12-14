

require_relative '../adapters/yelp_adapter.rb'

class AmenitiesController < ApplicationController

  def create
     amenities = YelpAdapter.search(search: params[:amenities][:search], location: params[:amenities][:zipcode])
    # amenities = [{name:"Sweetleaf", lat:"40.7196144088212", lon:"-73.9623124627487"}, {name:"Mama Jo's Breakfast Cart", lat:"40.7552739", lon:"-73.9752571"}]
     render json: {amenities: amenities}
  end

end
