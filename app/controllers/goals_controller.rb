class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :admin_user, only: :index

  def index
    @goals = Goal.all.order('created_at ASC')
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.valid?
      @goal.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :deadline, :progress, :done).merge(user_id: current_user.id)
  end

  def admin_user
    redirect_to admin_users_path if current_user.position_id == 2
  end

end
