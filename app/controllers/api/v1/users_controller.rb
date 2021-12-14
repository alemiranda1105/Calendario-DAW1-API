class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if params[:username]
      @user = User.find_by_username(params[:username])
    else
      @users = User.all
      if @users.blank?
        @users = nil
      end
    end
    if @users || @user
      respond_to :json
    else
      render json: {"error": "No encontrado"}, status: :not_found
    end
  end
end
