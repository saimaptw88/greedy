class Api::V1::WantController < Api::V1::BaseApiController
  before_action :set_params, only: [:show, :update, :destroy]
  def index
    wants = current_user.wants.order(priority: :asc)
    want1 = []
    want2 = []
    # wantをカテゴリごとに分類
    wants.each do |want|
      if want.category_id == 1
        want1.push(want)
      else
        want2.push(want)
      end
    end
    # 並び順をpriorityに設定
    # binding.pry
    want1 = want1.each_with_index {|want, index| want.priority = index }
    want2 = want2.each_with_index {|want, index| want.priority = index }

    # カテゴリ1とカテゴリ2のwantをフラットに結合
    @wants = want1.push(want2).flatten!
    render json: @wants, each_serializer: Api::V1::PreviewWantSerializer
  end

  def show
    render json: @want, serializer: Api::V1::PreviewWantSerializer
  end

  def create
    @want = current_user.wants.create!(want_params)
    render json: @want, serializer: Api::V1::PreviewWantSerializer
  end

  def update
    @want.update!(want_params)
    render json: @want, serializer: Api::V1::PreviewWantSerializer
  end

  def destroy
    @want.destroy!
    @wants = current_user.wants.order(priority: :asc)
    @wants = @wants.each_with_index {|want, index| want.priority = index }
    render json: @wants, each_serializer: Api::V1::PreviewWantSerializer
  end

  private

    def set_params
      @want = current_user.wants.find(params[:id])
    end

    def want_params
      params.require(:want).permit(:name, :priority, :reachability, :category_id, :why, :deadline, :every_day_task)
    end
end
