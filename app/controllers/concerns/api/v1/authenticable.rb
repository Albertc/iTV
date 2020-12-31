# frozen_string_literal: true

module Api
  module V1
    module Authenticable
      extend ActiveSupport::Concern

      included do
        before_action :authenticate

        attr_reader :current_user
      end

      private

      def authenticate
        # As README indicates "There is no need to implement authentication
        # nor authorization**. Suppose that the user is already registered
        # and authenticated, you can identify the user in each request
        # by a parameter like user_id. we assume there is a authenticated user"
        @current_user = User.find(params[:user_id])
      rescue ActiveRecord::RecordNotFound
        @current_user = nil
      end
    end
  end
end
