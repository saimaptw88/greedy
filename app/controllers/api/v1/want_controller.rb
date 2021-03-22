class Api::V1::WantController < ApplicationController
  before_action :set_params, only: [:show, :update, :destroy]
  def index
    @wants = current_user.wants.order(priority: :asc)
    render json: @wants, each_serializer: Api::V1::PreviewWantSerializer
  end

  def show
    render json: @want, serializer: Api::V1::PreviewWantSerializer
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    def set_params
      @want = current_user.wants.find(params[:id])
    end
end
