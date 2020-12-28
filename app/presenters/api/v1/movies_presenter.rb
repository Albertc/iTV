# frozen_string_literal: true

# Set up the fields that json api must return
module Api
  module V1
    # Preseter to define json response in movies_controller#index
    class MoviesPresenter
      def initialize(movies)
        @movies = movies
      end

      def present
        @movies.map do |movie|
          { id: movie.id, title: movie.title, plot: movie.plot }
        end
      end
    end
  end
end
