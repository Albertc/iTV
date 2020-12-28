# frozen_string_literal: true

# Set the fields that json api must return
module Api
  module V1
    # Preseter to define json response in movies_controller#index
    class EpisodePresenter
      attr_reader :episode

      def initialize(episode)
        @episode = episode
      end

      def present
        {
          id: episode.id,
          number: episode.number,
          title: episode.title,
          plot: episode.plot
        }
      end
    end
  end
end
