class Api::V1::WantController < ApplicationController
  def index
    @wants = current_user.wants.order(priority: :asc)
    render json: @wants, each_serializer: Api::V1::PreviewWantSerializer
  end
end
