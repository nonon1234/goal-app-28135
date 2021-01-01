class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :destroy]
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @goal.user_id
  end

  def update
    if @goal.update(goal_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy if current_user.id == @goal.user_id
    redirect_to root_path
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :deadline, :progress, :done, :important).merge(user_id: current_user.id)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

end
