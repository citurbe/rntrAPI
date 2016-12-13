require 'byebug'
require 'httparty'

class GetautocompletesAdapter
  include HTTParty
  def self.get_autocompletes(searchTerm)
     key = "AIzaSyAkmquJSszSyTQei0VfZkamDVtODzYK1kE"

     response = self.get("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=#{searchTerm}&location=40.766485,-73.978221&radius=500&key=#{key}")
    
     JSON(response.body)["predictions"].map do|pred|
        pred["structured_formatting"]["main_text"] + " " + pred["structured_formatting"]["secondary_text"]
     end
  end
end



