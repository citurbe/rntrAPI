require 'httparty'

class YelpAdapter
  include HTTParty
  # def self.client
  #
  #   @client ||= Yelp::Client.new({
  #     consumer_key: "VgBqgM2m0cFktXaWg7MirA",
  #     consumer_secret: "CwavGnQCgdvdVY9fWELZ3ngWhjc",
  #     token: "6ekU32QlnASLZQ29K6jV2iH8jg9M39ap",
  #     token_secret: "txCmSP_tTYILR2nNPXtJq30RhCQ"
  #   })
  # end

  def self.search(search:, location:)
    # self.client.search(location, {term: search, radius_filter: 250})
    HTTParty.get('https://api.yelp.com/v3/businesses/search',
    :query => {term: search, location: location, radius: 250},
    :headers => {"Authorization" => "Bearer bV0sWEjlBh-8WQLGPoabhLNvnJf3GyCll4AfLxxLwWgcos9jN9qUhxaa-I8kK7CdVJVD0tZ4wii3VQzs0j238ROREOaaB3rEHptA2ASpHajV-UQCsa--jviFj-xGWHYx"})
  end

  def self.get_map_markers(search:, location:)
    businesses = self.search(search: search, location: location).parsed_response.fetch("businesses")
    businesses.map{|result| {name: result.fetch("name"),
      lat:result.fetch("coordinate").fetch("latitude"),
      lon:result.fetch("coordinate").fetch("longitude")
    }}
  end

  def self.get_amenities(search:, apartment:)
    results = self.search(search: search, location: apartment.address).parsed_response.fetch("businesses")
    AptAmenity.create(apartment_id: apartment.id, count: results.size, name: search)
  end

end
