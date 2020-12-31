# frozen_string_literal: true

# Class Purchase, belongs to user and purchase_option (price and )
class Purchase < ApplicationRecord
  MESSAGE_DUPLICATED_PURCHASE = 'already rented and has not yet expired'
  belongs_to :user, touch: true
  belongs_to :purchase_option

  before_validation :set_expired_at, on: :create

  validates_associated :user, :purchase_option
  validate :duplicate_purchase_validation, on: :create

  scope :not_expired, -> { where('expired_at > ?', Time.now.utc) }
  scope :ordered, -> { order(expired_at: :desc) }

  private

  def set_expired_at
    self.expired_at = Time.now.utc + 2.days
  end

  def duplicate_purchase_validation
    if user && user.purchases
                   .not_expired
                   .where(purchase_option_id: purchase_option_id).any?

      errors.add(:purchase_option_id, MESSAGE_DUPLICATED_PURCHASE)
    end
  end
end
