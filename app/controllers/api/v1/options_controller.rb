module Api
  module V1
   class OptionsController < ApplicationController

  def index
    options = Option.all
    render json: { status: 'SUCCESS', message: 'loaded options', data: options }
  end

   end
  end
end
