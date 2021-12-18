require 'securerandom'

class Api::V1::SessionsController < ApplicationController

  # index/token para comprobar que existe
  def index
    if params[:token]
      @session = Session.find_by(token: params[:token])
      if session
        @current_user = User.find(@session.user_id)
        respond_to :json
      end
    end
  end

  # create para inicio sesion registro
  def create
    @session = Session.new(user_id: params[:user_id], token: SecureRandom.hex)
    if @session.save
      result = { session: { id: @session.id, token: @session.token } }
      render json: result
    else
      render json: { error: "Ha ocurrido un error" }, status: :not_found
    end
  end

  # destroy para logout
  def logout
    @session = Session.find_by(token: params[:token])
    @session.destroy
    render json: { logout: true }, status: :ok
  end
end
