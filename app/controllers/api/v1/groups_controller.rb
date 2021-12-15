class Api::V1::GroupsController < ApplicationController
  def index
    @groups = Group.all
    respond_to :json
  end
end
