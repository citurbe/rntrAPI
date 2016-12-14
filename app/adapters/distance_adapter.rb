# sample request url: https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood4&key=AIzaSyAkmquJSszSyTQei0VfZkamDVtODzYK1kE
# API Key: AIzaSyAkmquJSszSyTQei0VfZkamDVtODzYK1kE

require 'httparty'
class DistanceAdapter
  include HTTParty

  def self.get_distance(apartment)

     response = self.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{apartment.address}&destination=#{apartment.user.destination}4&key=AIzaSyAkmquJSszSyTQei0VfZkamDVtODzYK1kE")
     duration = JSON(response.body)["routes"][0]["legs"][0]["duration"]["value"]/60
     AptCommute.create(apartment_id: apartment.id, duration: duration)
  end


end
