class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.includes(:goals)
    @goals = Goal.all
  end

  private

  def admin_user
    redirect_to root_path unless current_user.position_id == 2
  end
  
end
