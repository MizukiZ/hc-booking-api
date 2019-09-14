module Api
  module V1
    class ClientsController < ApplicationController
      before_action :authorize_request, except: :create
      before_action :set_client, only: [:update, :destroy]

      def index
        clients = Client.all
        render json: { status: 'SUCCESS', message: 'loaded client', data: clients }
      end

      def create
        client = Client.new(client_params)
        if client.save
          render json: { status: 'SUCCESS', message: 'created the client', data: client }
        else
          render json: { status: 'ERROR', message: 'client not saved', data: client.errors }
        end
      end

      def update
        if @client.update(client_params)
          render json: { status: 'SUCCESS', message: 'updated the client', data: @client }
        else
          render json: { status: 'ERROR', message: ' client could not be updated', data: @client }
        end
      end

      def destroy
        @client.destroy
        render json: { status: 'SUCCESS', message: 'deleted the client', data: @client }
      end

      private
      def client_params
        params.require(:client).permit(:first_name,:last_name,:email,:phone)
      end

      def set_client
        @client = Client.find(params[:id])
      end

    end
  end
end