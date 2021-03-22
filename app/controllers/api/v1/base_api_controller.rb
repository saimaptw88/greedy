class Api::V1::BaseApiController < ApplicationController
  before_action :authenticate_user!
  # current_user
end
