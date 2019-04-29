module Api
  module V1
    class ChallengeSummariesController < ApplicationController
      protect_from_forgery with: :null_session
      def show
        render json: { detail: ChallengeSummary.find_by!(params[:id])}
      end

      def create
        summary = ChallengeSummary.new
        summary.challenge_id = summary_params[:challenge_id]
        summary.s3_key = 'https://aaaa.com'
        render json: {status: summary.save!}
      end

      private

      def summary_params
        params.permit(:challenge_id)
      end
    end
  end
end
