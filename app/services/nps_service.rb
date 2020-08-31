class NPSService
  def parks(state)
    response = conn.get("/api/v1/parks?stateCode=#{state}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://developer.nps.gov") do |faraday|
      faraday.params["api_key"] = ENV["NPS-API-KEY"]
    end
  end
end
