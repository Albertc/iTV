# frozen_string_literal: true

class Season < Content
  has_many :episodes, foreign_key: 'parent_id', dependent: :restrict_with_error

  has_many :purchase_options, as: :purchasable, dependent: :destroy

  scope :ordered, ->{order(:created_at)}
end
