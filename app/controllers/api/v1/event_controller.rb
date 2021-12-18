class Api::V1::EventController < ApplicationController
  def index
    @events = Event.all
    respond_to :json
  end

  def show
    @event = Event.find(params[:id])
    respond_to :json
  end

end
