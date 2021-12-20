class Api::V1::GroupsController < ApplicationController
  # https://stackoverflow.com/questions/36268281/rails-create-object-has-many-through <- Enlace para crear many to many
  def index
    @groups = Group.all
    respond_to :json
  end

  # GET groups por id 
  def show
    @group = Group.find(params[:id])
    respond_to :json
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      respond_to :json
    else
      render :json => { error: "No se ha podido crear el grupo" }, status: :internal_server_error
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      respond_to :json
    else
      render :json => { error: "No se ha podido actualizar el grupo" }, status: :internal_server_error
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
