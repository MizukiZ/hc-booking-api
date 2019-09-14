module Api
  module V1
   class OptionsController < ApplicationController
    before_action :authorize_request

  def index
    options = Option.all
    render json: { status: 'SUCCESS', message: 'loaded options', data: options }
  end

   end
  end
end
