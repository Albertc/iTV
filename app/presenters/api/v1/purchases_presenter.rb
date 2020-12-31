# frozen_string_literal: true

# Set the fields that json api must return
module Api
  module V1
    # Preseter to define json response in seasons_controller#index
    class PurchasesPresenter
      def initialize(purchases)
        @purchases = purchases
      end

      def present
        @purchases.map do |purchase|
          purchasable = purchasable_item(purchase)

          {
            id: purchase.id,
            title: purchasable.title,
            plot: purchasable.plot,
            type: purchasable.class.name
          }.merge(episodes(purchasable))
        end
      end

      private

      def purchasable_item(purchase)
        purchase.purchase_option.purchasable
      end

      def episodes(purchasable)
        return {} unless purchasable.instance_of?(Season)

        {
          episodes: purchasable.episodes.ordered.map do |episode|
                      EpisodePresenter.new(episode).present
                    end
        }
      end
    end
  end
end
