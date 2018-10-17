class StationSearch
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    data = service.stations_by_distance
    data[:fuel_stations].map do |station_data|
      Station.new(station_data)
    end
  end

  def service
    NrelService.new(@zip_code)
  end
end
