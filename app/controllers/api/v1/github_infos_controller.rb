# frozen_string_literal: true

module Api
  module V1
    class GithubInfosController < ApplicationController
      def show
        service = Githubs::FetcherInfo.call(params[:username])
        if service.success?
          render json: { github_info: service.github_info }, status: :ok
        else
          render json: { error: service.error_message }, status: :unprocessable_entity
        end
      end
    end
  end
end
