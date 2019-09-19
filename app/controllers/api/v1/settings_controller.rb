module Api
  module V1
   class SettingsController < ApplicationController
    before_action :authorize_request, except: :index

  def index
    settings = Setting.first
    render json: { status: 'SUCCESS', message: 'loaded settings', data: settings }
  end

  def update
    setting = Setting.find(params[:id])
    
    if setting.update(setting_params)
      render json: { status: 'SUCCESS', message: 'settings successfully upated', data: setting }
    else
      render json: { status: 'ERROR', message: 'settings could not be updated', data: setting.errors }
    end
  end

  private
   def setting_params
    params.require(:setting).permit(:start_time, :end_time, :interval, :duration, :days_availability)
   end

   end
  end
end

