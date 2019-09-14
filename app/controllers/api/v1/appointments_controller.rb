module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :authorize_request, except: :create
      before_action :set_appointment, only: [:update, :destroy]

      def index
        # get only feature appointments
        appointments = Appointment.all.where('start_at >=?', DateTime.now + 10.hours)
        render json: { status: 'SUCCESS', message: 'loaded appointments', data: appointments }
      end

      def create
        appointment = Appointment.new(appointment_params)
        if appointment.save
          render json: { status: 'SUCCESS', message: 'created the appointment', data: appointment }
        else
          render json: { status: 'ERROR', message: 'appointment not saved', data: appointment.errors }
        end
      end

      def update
        if @appointment.update(appointment_params)
          render json: { status: 'SUCCESS', message: 'updated the appointment', data: @appointment }
        else
          render json: { status: 'ERROR', message: ' appointment could not be updated', data: @appointment }
        end
      end

      def destroy
        @appointment.destroy
        render json: { status: 'SUCCESS', message: 'deleted the appointment', data: @appointment }
      end

      private
      def appointment_params
        params.require(:appointment).permit(:client_id,:option_id,:start_at,:end_at, :stripe_id, :content)
      end

      def set_appointment
        @appointment = Appointment.find(params[:id])
      end

    end
  end
end
