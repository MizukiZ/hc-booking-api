module Api
  module V1
class AdminsController < ApplicationController
  before_action :authorize_request

  def index
        render json: { status: 'SUCCESS', message: 'loaded admin', data: @current_admin }
  end
end
  end
end
