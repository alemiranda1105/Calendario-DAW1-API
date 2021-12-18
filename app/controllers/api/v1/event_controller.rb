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
    if params[:individual]
      @event = Event.new(event_params)
    else
      @event = Event.new(event_group_params)
    end
    if @event.save
      if @event.owner_id
        user = User.find(params[:owner_id])
        user.events << @event
      else
        group = Group.find(params[:group_id])
        group.events << @event
      end
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
    @event = Event.find(params[:id])
    @event.destroy
    render json: { destroyed: true }, status: :ok
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :individual, :owner_id)
  end
  
  def event_group_params
    params.require(:event).permit(:name, :description, :date, :individual, :group_id)
  end

end
