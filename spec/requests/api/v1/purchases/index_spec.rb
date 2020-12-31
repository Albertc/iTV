# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '[GET] /api/v1/library', type: :request do
  let(:user) { create(:user) }
  let!(:movie_rental) { create(:movie_purchase, user: user) }
  let!(:season_rental) { create(:season_purchase, user: user) }
  let(:season) { season_rental.purchase_option.purchasable }
  let(:first_episode) { season.episodes.ordered.first }
  let(:second_episode) { season.episodes.ordered.second }
  let(:last_episode) { season.episodes.ordered.last }
  let(:expected_result) do
    {
      'library' =>
        [
          {
            'id' => movie_rental.id,
            'title' => 'movie test title',
            'plot' => 'movie test plot',
            'type' => 'Movie'
          },
          {
            'id' => season_rental.id,
            'title' => 'Season title',
            'plot' => 'Season plot',
            'type' => 'Season',
            'episodes' =>
              [
                {
                  'id' => first_episode.id,
                  'number' => first_episode.number,
                  'title' => "Episode num. #{first_episode.number}",
                  'plot' => 'Plot of the episode'
                },
                {
                  'id' => second_episode.id,
                  'number' => second_episode.number,
                  'title' => "Episode num. #{second_episode.number}",
                  'plot' => 'Plot of the episode'
                },
                {
                  'id' => last_episode.id,
                  'number' => last_episode.number,
                  'title' => "Episode num. #{last_episode.number}",
                  'plot' => 'Plot of the episode'
                }
              ]
          }
        ]
    }
  end

  context 'with valid parameters' do
    subject { get '/api/v1/library', params: { user_id: user.id } }

    before { subject }

    shared_examples 'returning the user library' do
      it_behaves_like 'successful endpoint'

      it 'returns a valid json schems for the user library' do
        expect(response).to match_json_schema('api/v1/purchases/index')
      end

      it 'returns the correct user library' do
        expect(json_response).to eq(expected_result)
      end
    end

    context 'without expired rentals' do
      it_behaves_like 'returning the user library'
    end

    context 'with expired items' do
      let!(:expired_rental) { create(:expired_purchase, user: user) }

      it_behaves_like 'returning the user library'
    end
  end

  context 'without user' do
    subject { get '/api/v1/library' }

    it_behaves_like 'conflict endpoint' do
      before { subject }
    end

    it 'returns an error message respone' do
      subject

      expect(json_response).to eq({ 'errors' => 'Invalid user' })
    end
  end
end
