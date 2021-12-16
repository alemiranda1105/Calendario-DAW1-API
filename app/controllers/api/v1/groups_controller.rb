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
end
