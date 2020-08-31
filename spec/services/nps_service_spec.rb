require 'rails_helper'

RSpec.describe 'National Park Service Service' do
  it 'can return parks' do
    nps_service = NPSService.new
    results = nps_service.parks("TN")

    expect(results).to be_a(Hash)
    # figure out how to test response status
    expect(results[:data]).to be_an(Array)
  end
end
