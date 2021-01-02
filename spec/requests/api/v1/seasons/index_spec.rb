# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '[GET] /api/v1/seasons', type: :request do
  let(:user) { create(:user) }

  describe '#index' do
    subject(:request) { get '/api/v1/seasons', params: { user_id: user.id } }

    shared_examples 'returning a successful result' do
      it_behaves_like 'successful endpoint'

      it 'returns a valid seasons schema' do
        expect(response).to match_json_schema('api/v1/seasons/index')
      end
    end

    context "when there aren't seasons to show" do
      before { request }

      it_behaves_like 'returning a successful result'

      it 'returns an empty array of seasons' do
        expect(response.body).to eq({ seasons: [] }.to_json)
      end
    end

    context 'when there are seasons to show' do
      let!(:second_season) do
        create(:season, title: 'Second season title',
                        plot: 'Second season plot',
                        number: 2)
      end
      let!(:first_season) do
        create(:season, title: 'First season title',
                        plot: 'First season plot',
                        number: 1,
                        created_at: Date.yesterday)
      end
      let(:expected_result) do
        first_episode_id = first_season.episodes.where(number: 1).first.id
        second_episode_id = first_season.episodes.where(number: 2).first.id

        {
          seasons:
            [
              {
                id: first_season.id,
                title: 'First season title',
                plot: 'First season plot',
                number: 1,
                episodes:
                  [
                    {
                      id: first_episode_id,
                      number: 1,
                      title: 'first episode',
                      plot: 'plot'
                    },
                    {
                      id: second_episode_id,
                      number: 2,
                      title: 'second episode',
                      plot: 'plot'
                    }
                  ]
              },
              {
                id: second_season.id,
                title: 'Second season title',
                plot: 'Second season plot',
                number: 2,
                episodes: []
              }
            ]
        }.to_json
      end

      before do
        first_season.episodes.create!(
          number: 2,
          title: 'second episode',
          plot: 'plot'
        )

        first_season.episodes.create!(
          number: 1,
          title: 'first episode',
          plot: 'plot'
        )

        request
      end

      it_behaves_like 'returning a successful result'

      it 'returns the ordered seasons and its episodes ordered by number' do
        expect(response.body).to eq(expected_result)
      end
    end
  end
end
