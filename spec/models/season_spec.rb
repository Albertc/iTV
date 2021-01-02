require 'rails_helper'

RSpec.describe Season, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }
  it { should validate_numericality_of(:number) }
  it { should validate_uniqueness_of(:number).scoped_to(%i[type parent_id]) }

  it { should have_many(:episodes).dependent(:restrict_with_error) }
  it { should have_many(:purchase_options).dependent(:destroy) }

  describe 'ordered scope' do
    let!(:second_season) { create(:season, number: 2) }
    let!(:first_season) { create(:season, created_at: Date.yesterday) }

    subject { Season.all.ordered }

    it do
      is_expected.to eq([first_season, second_season])
    end
  end
end
