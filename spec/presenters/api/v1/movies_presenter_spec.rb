# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MoviesPresenter do
  describe '#present' do
    let(:first_movie) do
      create(:movie, title: 'first movie title', plot: 'first movie plot')
    end
    let(:second_movie) do
      create(:movie, title: 'second movie title', plot: 'second movie plot')
    end

    context 'when there are movies to show' do
      let(:expected_result) do
        [
          {
            id: first_movie.id,
            title: 'first movie title',
            plot: 'first movie plot'
          },
          {
            id: second_movie.id,
            title: 'second movie title',
            plot: 'second movie plot'
          }
        ]
      end

      subject { described_class.new([first_movie, second_movie]).present }

      it 'returns valid array' do
        is_expected.to eq(expected_result)
      end
    end

    context "when there aren't movies to show" do
      subject { described_class.new([]).present }

      it 'returns an empty array' do
        is_expected.to eq([])
      end
    end
  end
end
