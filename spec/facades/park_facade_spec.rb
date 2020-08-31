require 'rails_helper'

RSpec.describe 'Park Facade' do
  before(:each) do
    @park_facade = ParkFacade.new("TN")
  end

  it "#get_parks_data" do
    actual = @park_facade.get_parks_data
    expect(actual).to be_a(Hash)
    expect(actual[:data]).to be_an(Array)
    expect(actual[:data].count).to eq(16)
    expect(actual[:data].first).to have_key(:fullName)
    expect(actual[:data].first).to have_key(:description)
    expect(actual[:data].first).to have_key(:directionsInfo)
    expect(actual[:data].first).to have_key(:operatingHours)
  end
end
