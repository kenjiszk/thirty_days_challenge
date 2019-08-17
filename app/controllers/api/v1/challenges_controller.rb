module Api
  module V1
    class ChallengesController < ApplicationController
      protect_from_forgery with: :null_session
      def create
        begin
          user = User.find_by!(uuid: challenge_params[:uuid])
          challenge = Challenge.new
          challenge.user_id = user.id
          challenge.name = challenge_params[:name]
          challenge.format = challenge_params[:format]
          challenge.save!
          render json: { status: 'SUCCESS', challenge_id: challenge.id, challenge_name: challenge.name }, status: 201
        rescue
          render json: { status: 'FAILED'}, status: 400
        end
      end

      def details
        details = ChallengeDetail.where(challenge_id: params[:challenge_id])
        render json: { details: details }
      end

      private

      def challenge_params
        params.permit(:uuid, :name, :format)
      end

    end
  end
end
