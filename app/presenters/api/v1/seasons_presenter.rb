  # frozen_string_literal: true

# Set the fields that json api must return
module Api
  module V1
    # Preseter to define json response in seasons_controller#index
    class SeasonsPresenter
      def initialize(seasons)
        @seasons = seasons
      end

      def present
        @seasons.map do |season|
          {
            id: season.id,
            title: season.title,
            plot: season.plot,
            number: season.number,
            episodes: episodes(season)
          }
        end
      end

      private

      def episodes(season)
        season.episodes.ordered.map do |episode|
          EpisodePresenter.new(episode).present
        end
      end
    end
  end
end
