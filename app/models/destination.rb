class Destination
  attr_accessor :lat, :lng, :name

  def initialize(name)
    @name = name

    coordinates = Geocoder.coordinates(name)
    @lat = coordinates.first
    @lng = coordinates.last
  end

  def venues
    FOURSQUARE_CLIENT.search_venues(ll: "#{lat},#{lng}").groups.first.items
  end

  def daily_forecast
    ForecastIO.forecast(lat, lng).daily.data
  end

  def lodging
    GOOGLE_PLACES_CLIENT.spots(lat, lng, types: 'lodging')
  end
end
