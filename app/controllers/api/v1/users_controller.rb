class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if params[:username]
      @users = User.find_by_username(params[:username])
    else
      @users = User.all
    end
    if @users
      respond_to :json
    end
  end
end
