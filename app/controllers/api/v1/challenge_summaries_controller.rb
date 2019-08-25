module Api
  module V1
    class ChallengeSummariesController < ApplicationController
      protect_from_forgery with: :null_session
      def show
        begin
          summary = ChallengeSummary.find_by!(params[:id])
          render json: { summary: summary }, status: 200
        rescue
          render json: { status: 'FAILED' }, status: 404
        end
      end

      def create
        summary = ChallengeSummary.new
        summary.challenge_id = summary_params[:challenge_id]
        summary.url = 'https://aaaa.com'
        begin
          summary.save!
          render json: {status: 'SUCCESS'}, status: 201
        rescue
          render json: {status: 'FAILED'}, status: 400
        end
      end

      private

      def summary_params
        params.permit(:challenge_id)
      end
    end
  end
end
