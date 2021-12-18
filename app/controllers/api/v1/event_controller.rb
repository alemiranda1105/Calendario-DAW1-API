class Api::V1::EventController < ApplicationController
  def index
    @events = Event.all
    respond_to :json
  end
end
