require 'httparty'
class MapAdapter
  include HTTParty
  def self.get_map(address)
    latLong = self.to_lat_long(address)
    "https://www.google.com/maps/embed/v1/streetview?key=AIzaSyAkmquJSszSyTQei0VfZkamDVtODzYK1kE&location=#{latLong["lat"]},#{latLong["lng"]}"
  end



  private
  def self.to_lat_long(address)
    newAddress = address.split(' ').join("+")
    response = self.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{newAddress}&key=AIzaSyAkmquJSszSyTQei0VfZkamDVtODzYK1kE")
    JSON(response.body)["results"][0]["geometry"]["location"]
  end


end
