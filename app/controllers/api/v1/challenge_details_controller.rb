module Api
  module V1
    class ChallengeDetailsController < ApplicationController
      protect_from_forgery with: :null_session
      def show
        begin
          detail = ChallengeDetail.find_by!(id: params[:id])
          render json: { detail: detail }
        rescue
          render json: { status: 'FAILED' }, status: 404
        end
      end

      def create
        begin
          detail = ChallengeDetail.find_by!(challenge_id: create_params[:challenge_id], frame_num: create_params[:frame_num])
          detail.url = create_params[:url]
          detail.date = create_params[:date]
        rescue
          detail = ChallengeDetail.create(
            challenge_id: create_params[:challenge_id],
            frame_num: create_params[:frame_num],
            url: create_params[:url],
            date: create_params[:date],
            comment: ""
          )
        end
        begin
          detail.save!
          render json: { status: 'SUCCESS' }, status: 201
        rescue
          render json: { status: 'FAILED' }, status: 400
        end
      end

      def update
        begin
          detail = ChallengeDetail.find_by!(id: update_params[:id])
          detail.comment = update_params[:comment]
          detail.save!
          render json: { status: 'SUCCESS' }, status: 200
        rescue
          render json: { status: 'FAILED' }, status: 404
        end
      end

      private

      def create_params
        params.permit(:challenge_id, :frame_num, :url, :date)
      end

      def update_params
        params.permit(:id, :comment)
      end
    end
  end
end
