class Api::V1::FriendRequestController < ApplicationController

  def show
    @friend_request = FriendRequest.find(params[id])
    respond_to :json
  end

  def create
    @friend_request = FriendRequest.new(request_params)
    if @friend_request.save
      user = User.find(params[:receiver])
      user.friend_requests << @friend_request
      render json: { created: true }
    else
      render json: { error: "Ha ocurrido un error"}, status: :internal_server_error
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
    render json: { deleted: true }
  end

  private

  def request_params
    params.require(:friend_request).permit(:sender, :receiver)
  end
end
