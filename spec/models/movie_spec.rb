require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many(:purchase_options).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:plot) }

  describe 'ordered scope' do
    let!(:second_movie) { create(:movie) }
    let!(:first_movie) { create(:movie, created_at: Date.yesterday) }

    subject { Movie.all.ordered }

    it do
      is_expected.to eq([first_movie, second_movie])
    end
  end
end
