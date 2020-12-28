# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '[GET] /api/v1/movies', type: :request do
  let(:user) { create(:user) }

  describe '#index' do
    subject(:request) { get '/api/v1/movies', params: { user_id: user.id } }

    shared_examples 'returning a successful result' do
      it_behaves_like 'successful endpoint'

      it 'returns a valid movies schema' do
        expect(response).to match_json_schema('api/v1/movies/index')
      end
    end

    context "when there aren't movies to show" do
      before { request }

      it_behaves_like 'returning a successful result'

      it 'returns an empty array of movies' do
        expect(response.body).to eq({ movies: [] }.to_json)
      end
    end

    context 'when there are movies to show' do
      let!(:second_movie) do
        create(:movie, title: 'second movie title', plot: 'second movie plot')
      end
      let!(:first_movie) { create(:movie, created_at: Date.yesterday) }
      let(:expected_result) do
        {
          movies:
            [
              {
                id: first_movie.id,
                title: 'movie test title',
                plot: 'movie test plot'
              },
              {
                id: second_movie.id,
                title: 'second movie title',
                plot: 'second movie plot'
              }
            ]
        }.to_json
      end

      before { request }

      it_behaves_like 'returning a successful result'

      it 'returns the movies ordered correctly' do
        expect(response.body).to eq(expected_result)
      end
    end
  end
end
