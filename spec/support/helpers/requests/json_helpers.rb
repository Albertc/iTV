# frozen_string_literal: true

module Requests
  # Helpers for request type specs
  module JsonHelpers
    def json_response
      JSON.parse(response.body)
    end
  end
end
