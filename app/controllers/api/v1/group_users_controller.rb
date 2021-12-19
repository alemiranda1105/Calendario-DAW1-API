class Api::V1::GroupUsersController < ApplicationController
  def create
    @group_user = GroupUser.new(group_user_params)
    if @group_user.save
      render json: { added: true }, status: :ok
    else
      render json: { error: "Ha ocurrido un error" }, status: :internal_server_error
    end
  end

  def leave_group
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @group_users = GroupUser.where(user_id: @user.id).all
    @group_users.each do |group_user|
      if group_user.group_id == @group.id
        group_user.delete
      end
    end
    render json: { deleted: true }, status: :ok
  end

  private

  def group_user_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end
