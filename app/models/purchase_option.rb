class PurchaseOption < ApplicationRecord
  belongs_to :purchasable, polymorphic: true

  validates :price, :video_quality, presence: true
  validates :video_quality, inclusion: { in: %w[HD SD] }

  validates :purchasable_id,
            uniqueness: { scope: %i[video_quality purchasable_type] }
end
