require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  it { should validate_presence_of(:video_quality) }
  it { should allow_values('HD', 'SD').for(:video_quality) }
  it { should validate_presence_of(:price) }
  it { should belong_to(:purchasable) }

  describe 'uniqueness validation by parent, video_quality and type' do
    subject do
      PurchaseOption.create(
        purchasable_type: 'Movie',
        purchasable_id: 1,
        video_quality: 'HD',
        price: 3.99
      )
    end

    it do
      should validate_uniqueness_of(:purchasable_id)
        .scoped_to(%i[video_quality purchasable_type])
    end
  end
end
