class ParksController < ApplicationController
  def index
    state = params[:state]

    conn = Faraday.new(url: "https://developer.nps.gov") do |faraday|
      faraday.params["api_key"] = ENV["NPS-API-KEY"]
    end

    response = conn.get("/api/v1/parks?stateCode=#{state}")
    json = JSON.parse(response.body, symbolize_names: true)

    @parks = json[:data]
  end
end
