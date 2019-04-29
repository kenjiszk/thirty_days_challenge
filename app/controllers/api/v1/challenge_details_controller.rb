module Api
  module V1
    class ChallengeDetailsController < ApplicationController
      protect_from_forgery with: :null_session
      def show
        begin
          detail = ChallengeDetail.find_by!(params[:id])
          render json: { detail: detail }
        rescue
          render json: { status: 'FAILED'}, status: 404
        end
      end

      def create
        detail = ChallengeDetail.new
        detail.challenge_id = details_params[:challenge_id]
        detail.frame_num = details_params[:frame_num]
        detail.s3_key = 'https://aaa.com'
        detail.date = details_params[:date]
        begin
          detail.save!
          render json: {status: 'SUCCESS'}, status: 201
        rescue
          render json: {status: 'FAILED'}, status: 400
        end
      end

      private

      def details_params
        params.permit(:challenge_id, :frame_num, :date)
      end
    end
  end
end
