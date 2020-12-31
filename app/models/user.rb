# frozen_string_literal: true

class User < ApplicationRecord
  has_many :purchases, -> { includes :purchase_option }, dependent: :destroy
end
