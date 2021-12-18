class Api::V1::EventController < ApplicationController
  def index
    @events = Event.all
    respond_to :json
  end

  def show
    @event = Event.find(params[:id])
    respond_to :json
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      user = User.find(params[:owner_id])
      user.events << @event
      render json: { evento: @event }
    else
      render json: { error: "Ha sucedido un error" }, status: :internal_server_error
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      render json: { evento: @event }
    else
      render json: { error: "Ha ocurrido un error" }, status: :internal_server_error
    end
  end

  def destroy

  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :individual, :owner_id)
  end

end
