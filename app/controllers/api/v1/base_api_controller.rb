class Api::V1::BaseApiController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  # current_user
end
