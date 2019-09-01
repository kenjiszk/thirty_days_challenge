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
        begin
          detail = ChallengeDetail.find_by!(challenge_id: details_params[:challenge_id], frame_num: details_params[:frame_num])
          detail.url = details_params[:url]
          detail.date = details_params[:date]
        rescue
          detail = ChallengeDetail.create(
            challenge_id: details_params[:challenge_id],
            frame_num: details_params[:frame_num],
            url: details_params[:url],
            date: details_params[:date]
          )
        end
        begin
          detail.save!
          render json: {status: 'SUCCESS'}, status: 201
        rescue
          render json: {status: 'FAILED'}, status: 400
        end
      end

      private

      def details_params
        params.permit(:challenge_id, :frame_num, :url, :date)
      end
    end
  end
end
