class ParksController < ApplicationController
  def index
    state = params[:state]

    park_facade = ParkFacade.new(state)
    @parks = park_facade.find_parks
  end
end
