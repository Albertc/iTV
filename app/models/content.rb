# frozen_string_literal: true

class Content < ApplicationRecord
  CLASS_NAMES_WITH_NUMBER = %w[Season Episode].freeze

  validates :title, :plot, :type, presence: true
  validates :number, numericality: { greater_than: 0 }, if: :with_number?
  validates :number, absence: true, if: :without_number?
  validates :number, uniqueness: { scope: %i[type parent_id] }, if: :with_number?

  private

  def with_number?
    CLASS_NAMES_WITH_NUMBER.include? type
  end

  def without_number?
    !with_number?
  end
end
