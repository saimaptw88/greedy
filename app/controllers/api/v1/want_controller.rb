class Api::V1::WantController < Api::V1::BaseApiController
  before_action :set_params, only: [:show, :update, :destroy]
  def index
    @wants = current_user.wants.order(priority: :asc)
    render json: @wants, each_serializer: Api::V1::PreviewWantSerializer
  end

  def show
    render json: @want, serializer: Api::V1::PreviewWantSerializer
  end

  def create
    @want = current_user.wants.create!(want_params)
  end

  def update
    @want.update!(want_params)
    render json: @want, serializer: Api::V1::PreviewWantSerializer
  end

  def destroy
    @want.destroy!
  end

  private

    def set_params
      @want = current_user.wants.find(params[:id])
    end

    def want_params
      params.require(:want).permit(:name, :priority, :reachability, :category_id)
    end
end
