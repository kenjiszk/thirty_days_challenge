module Api
  module V1
    class ChallengeDetailsController < ApplicationController
      protect_from_forgery with: :null_session
      def show
        render json: { detail: ChallengeDetail.find_by!(params[:id])}
      end

      def create
        detail = ChallengeDetail.new
        detail.challenge_id = details_params[:challenge_id]
        detail.frame_num = details_params[:frame_num]
        detail.s3_key = 'https://aaa.com'
        detail.date = details_params[:date]
        render json: {status: detail.save!}
      end

      private

      def details_params
        params.permit(:challenge_id, :frame_num, :date)
      end
    end
  end
end
