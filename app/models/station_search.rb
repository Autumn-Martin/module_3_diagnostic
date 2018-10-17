class StationSearch
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&fuel_type=ELEC, LPG&limit=10&api_key=ENV["nrel_api_key"]
    conn = Faraday.new(url: "https://developer.nrel.gov/v1/nearest.json?") do |faraday|
      faraday.params["location"] = "80203"
      faraday.params["fuel_type"] = "ELEC, LPG"
      faraday.params["limit"] = 10
      faraday.params["api_key"] = ENV["nrel_api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
