# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SeasonsPresenter do
  describe '#present' do
    let(:first_season) do
      create(:season,
             :with_3_episodes,
             title: 'first season title', plot: 'first season plot')
    end
    let(:second_season) do
      create(:season,
             :with_3_episodes,
             title: 'second season title', plot: 'second season plot')
    end

    context 'when there are seasons to show' do
      let(:expected_result) do
        first_season_episodes = first_season.episodes.ordered
        second_season_episodes = second_season.episodes.ordered

        [
          {
            id: first_season.id,
            title: 'first season title',
            plot: 'first season plot',
            number: first_season.number,
            episodes:
              [
                {
                  id: first_season_episodes.first.id,
                  number: first_season_episodes.first.number,
                  title: "Episode num. #{first_season_episodes.first.number}",
                  plot: 'Plot of the episode'
                },
                {
                  id: first_season_episodes.second.id,
                  number: first_season_episodes.second.number,
                  title: "Episode num. #{first_season_episodes.second.number}",
                  plot: 'Plot of the episode'
                },
                {
                  id: first_season_episodes.last.id,
                  number: first_season_episodes.last.number,
                  title: "Episode num. #{first_season_episodes.last.number}",
                  plot: 'Plot of the episode'
                }
              ]
          },
          {
            id: second_season.id,
            title: 'second season title',
            plot: 'second season plot',
            number: second_season.number,
            episodes:
              [
                {
                  id: second_season_episodes.first.id,
                  number: second_season_episodes.first.number,
                  title: "Episode num. #{second_season_episodes.first.number}",
                  plot: 'Plot of the episode'
                },
                {
                  id: second_season_episodes.second.id,
                  number: second_season_episodes.second.number,
                  title: "Episode num. #{second_season_episodes.second.number}",
                  plot: 'Plot of the episode'
                },
                {
                  id: second_season_episodes.last.id,
                  number: second_season_episodes.last.number,
                  title: "Episode num. #{second_season_episodes.last.number}",
                  plot: 'Plot of the episode'
                }
              ]
          }
        ]
      end

      subject { described_class.new([first_season, second_season]).present }

      it 'returns valid array' do
        is_expected.to eq(expected_result)
      end
    end

    context "when there aren't seasons to show" do
      subject { described_class.new([]).present }

      it 'returns an empty array' do
        is_expected.to eq([])
      end
    end
  end
end
