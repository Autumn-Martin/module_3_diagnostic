class NrelService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations_by_distance
    get_data("/api/alt-fuel-stations/v1/nearest.json")
  end

  def get_data(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
    faraday.params["location"] = "80203"
    faraday.params["fuel_type"] = "ELEC, LPG"
    faraday.params["limit"] = 10
    faraday.params["api_key"] = ENV["nrel_api_key"]
    faraday.adapter Faraday.default_adapter
    end
  end
end
