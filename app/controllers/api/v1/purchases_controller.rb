# frozen_string_literal: true

module Api
  module V1
    # Purchases controller to make a purchase and get library of a user
    class PurchasesController < ApplicationController
      include Authenticable
      include Cacheable

      # POST /api/v1/purchase_options/:purchase_option_id/purchases
      def create
        create_purchase

        if valid_purchase?
          render json: { purchase: purchase }
        else
          render json: { errors: purchase_errors }, status: :conflict
        end
      end

      # GET /purchases # Library
      def index
        if current_user
          render json: { library: user_library }
        else
          render json: { errors: 'Invalid user' }, status: :conflict
        end
      end

      private

      attr_reader :purchase_creator

      def create_purchase
        @purchase_creator = PurchaseCreator.call(
          current_user, params[:purchase_option_id]
        )
      end

      def purchase
        purchase_creator[:purchase]
      end

      def purchase_errors
        purchase_creator[:errors]
      end

      def valid_purchase?
        purchase_creator[:purchase].present?
      end

      def user_library
        Rails.cache.fetch(user_library_cache_key) do
          PurchasesPresenter.new(query_user_library).present
        end
      end

      def query_user_library
        current_user.purchases.ordered.not_expired
      end

      def valid_user?
        current_user&.instance_eval(User)
      end
    end
  end
end
