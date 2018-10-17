class StationSearch
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&fuel_type=ELEC, LPG&limit=10&api_key=ENV["api_key"]
  end
end
