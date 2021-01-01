# frozen_string_literal: true

require Rails.root.join('app', 'presenters', 'api', 'v1', 'movies_presenter.rb')

module Api
  module V1
    class MoviesController < ApplicationController
      include Cacheable

      def index
        render json: { movies: movies }
      end

      private

      def movies
        Rails.cache.fetch(cache_key_for(Movie)) do
          MoviesPresenter.new(query_all_movies).present
        end
      end

      def query_all_movies
        Movie.ordered.select(:id, :title, :plot).page(params[:page])
      end
    end
  end
end
