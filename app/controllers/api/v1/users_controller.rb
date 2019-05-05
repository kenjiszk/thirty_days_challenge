module Api
  module V1
    class UsersController < ApplicationController
      protect_from_forgery with: :null_session
      def show
        user = User.find_by(uuid: params[:uuid])
        if user.nil?
          render json: {message: 'user not found'}, status: 404
        else
          render json: {user: {id: user.id, uuid: user.uuid} }
        end
      end

      def create
        user = User.new(user_params)
        begin
          user.save!
          render json: {user: {id: user.id}}, status: 201
        rescue
          render json: { status: 'FAILED' }, status: 400
        end
      end

      def challenges
        user = User.find_by(uuid: params[:user_uuid])
        if user.nil?
          render json: {message: 'user not found'}, status: 400
        else
          challenges = user.challenges
          render json: {challenges: challenges}
        end
      end

      private

      def user_params
        params.permit(:uuid)
      end
    end
  end
end
