# frozen_string_literal: true

class Movie < Content
  has_many :purchase_options, as: :purchasable, dependent: :destroy

  scope :ordered, ->{order(:created_at)}
end
