module Api
  module V1
   class SettingsController < ApplicationController

  def index
    settings = Setting.first
    render json: { status: 'SUCCESS', message: 'loaded settings', data: settings }
  end

   end
  end
end

