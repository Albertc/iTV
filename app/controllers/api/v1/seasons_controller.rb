# frozen_string_literal: true

require Rails
  .root.join('app', 'presenters', 'api', 'v1', 'seasons_presenter.rb')

module Api
  module V1
    # Season controller
    class SeasonsController < ApplicationController
      include Cacheable

      def index
        render json: { seasons: seasons }
      end

      private

      def seasons
        Rails.cache.fetch(cache_key_for(Season)) do
          SeasonsPresenter.new(query_all_seasons).present
        end
      end

      def query_all_seasons
        Season.ordered
              .select(:id, :title, :plot, :number)
              .includes(:episodes)
              .page(params[:page])
      end
    end
  end
end
