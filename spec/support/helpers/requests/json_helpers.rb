# frozen_string_literal: true

module Requests
  # Helpers for request type specs
  module JsonHelpers
    # TODO: If not used remove all the file
    def json_response
      JSON.parse(response.body)
    end
  end
end
