class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:login, :create]
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
      render json: { error: "No encontrado" }, status: :not_found
    end
  end

  # GET user por id
  def show
    @user = User.find(params[:id])
    respond_to :json
  end

  # POST user (registro de nuevo usuario)
  def create
    @user = User.new(user_params)
    if @user.save
      @session = Session.create(user_id: @user.id, token: SecureRandom.hex)
      result = { user: { id: @user.id, username: @user.username, email: @user.email }, session: { token: @session.token } }
      render json: result
    else
      render json: { error: "Ha ocurrido un error" }, status: :not_found
    end
  end

  def login
    @user = User.find_by_username(params[:username])
    if @user
      if @user.password == params[:password]
        @session = Session.create(user_id: @user.id, token: SecureRandom.hex)
        render json: { user: { id: @user.id, username: @user.username, email: @user.email }, session: { token: @session.token } }
      else
        render json: { error: "Contraseña/Usuario incorrecto" }, status: :unauthorized
      end
    else
      render json: { error: "Contraseña/Usuario incorrecto" }, status: :unauthorized
    end
  end

  def add_friend
    @user = User.find(params[:user_id])
    new_friend = User.find(params[:friend_id])
    old_friends = @user.friendships.length
    @user.friendships << new_friend
    new_friend.friendships << @user
    if old_friends < @user.friendships.length
      respond_to :json
    else
      render json: { error: "no se ha podido añadir al amigo" }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
