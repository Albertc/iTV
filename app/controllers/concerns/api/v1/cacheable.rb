# frozen_string_literal: true

module Api
  module V1
    module Cacheable
      extend ActiveSupport::Concern

      private

      def cache_key_for(model)
        [model.all.cache_key, { version: model.all.cache_version }]
      end

      def user_library_cache_key
        [current_user.cache_key, { version: current_user.cache_version }]
      end
    end
  end
end
