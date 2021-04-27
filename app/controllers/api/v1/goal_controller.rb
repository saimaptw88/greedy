class Api::V1::GoalController < Api::V1::BaseApiController
  before_action :set_params, only: [:show, :update]
  def show
    render json: @goal, seliarizer: Api::V1::GoalSerializer
  end

  def create
    @wants = current_user.wants.all
    @wants.map do |want|
      if want.category_id == 1 && want.priority == 0
        @want = current_user.wants.find(want.id)
      end
    end
    @goal = current_user.build_goal(id: @want.id, name: @want.name, category_id: @want.category_id, priority: @want.priority)
    @goal.save!
    render json: @goal, seliarizer: Api::V1::GoalSerializer
  end

  def update
    # binding.pry
    @goal.update!(update_params)
    @want = current_user.wants.find(@goal.id)
    @want.update!(name: @goal.name)
    render json: @goal, seliarizer: Api::V1::GoalSerializer
  end

  private

    def set_params
      @goal = current_user.goal
    end

    def goal_params
      params.require(:goal).permit(:id, :name, :priority, :category_id)
    end

    def update_params
      params.require(:goal).permit(:name, :deadline, :why, :reachability, :every_day_task)
    end
end
