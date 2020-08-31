class ParkFacade
  def initialize(state)
    @state = state
    @nps_service ||= NPSService.new
  end

  def find_parks
    parks_data = get_parks_data
    parks_data[:data].map do |park_data|
      Park.new(park_data)
    end
  end

  def get_parks_data
    @nps_service.parks(@state)
  end
end
