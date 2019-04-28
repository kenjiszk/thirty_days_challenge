module Api
  module V1
    class UsersController < ApplicationController
      protect_from_forgery with: :null_session
      def show
        user = User.find_by!(uuid: params[:uuid])
        render json: {user: user}
      end

      def create
        user = User.new(user_params)
        user.save
        render json: { status: 'SUCCESS', data: params }
      end

      def challenges
        user = User.find_by!(uuid: params[:user_uuid])
        challenges = user.challenges
        render json: {status: 'SUCCESS', data: challenges}
      end

      private

      def user_params
        params.permit(:uuid)
      end
    end
  end
end
