class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user

  def authenticate_user
    @session = Session.find_by(token: params[:token])
    unless @session
      render json: { error: "¿Intentas acceder sin permiso :( ?" }, status: :unauthorized
    end
  end
end
