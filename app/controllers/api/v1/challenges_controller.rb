module Api
  module V1
    class ChallengesController < ApplicationController
      protect_from_forgery with: :null_session
      def create
        user = User.find_by!(uuid: challenge_params[:uuid])
        challenge = Challenge.new
        challenge.user_id = user.id
        challenge.name = challenge_params[:name]
        challenge.format = challenge_params[:format]
        render json: { status: challenge.save!}
      end

      private

      def challenge_params
        params.permit(:uuid, :name, :format)
      end
    end
  end
end
