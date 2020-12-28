# frozen_string_literal: true

require_relative 'helpers/requests/json_helpers.rb'

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request
end
