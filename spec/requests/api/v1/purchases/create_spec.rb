# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '[POST] /api/v1/purchase_options/:purchase_option_id/purchases',
               type: :request do
  let(:movie_purchase_option) { FactoryBot.create(:purchasable_movie, :sd) }
  let(:user) { create(:user) }

  shared_examples 'can not rent a movie or season' do
    it_behaves_like 'conflict endpoint' do
      before { subject }
    end

    it 'returns an error message respone' do
      subject

      expect(json_response).to eq(expected_result)
    end

    it 'does not create a new purchase' do
      expect { subject }.not_to(change { Purchase.count })
    end
  end

  context 'with valid parameters' do
    context 'wen user can rent a movie or season successfully' do
      let(:expected_result) do
        purchase = Purchase.last

        {
          'id' => purchase.id,
          'user_id' => purchase.user_id,
          'expired_at' => (Time.now.utc + 2.days).strftime('%F'),
          'purchase_option_id' => movie_purchase_option.id
        }
      end

      subject do
        post "/api/v1/purchase_options/#{movie_purchase_option.id}/purchases",
             params: { user_id: user.id }
      end

      it_behaves_like 'successful endpoint' do
        before { subject }
      end

      it 'returns a valid purchase response' do
        subject

        expect(json_response['purchase']).to include(expected_result)
      end

      it 'creates a new purchase' do
        expect { subject }.to change { Purchase.count }.by(1)
      end
    end

    context 'when a user tries to rent a movie already rented '\
      'and not expired' do
      let(:expected_result) do
        { 'errors' => 'Purchase option already rented and has not yet expired' }
      end

      subject do
        post "/api/v1/purchase_options/#{movie_purchase_option.id}/purchases",
             params: { user_id: user.id }
      end

      before do
        create(:purchase,
               purchase_option_id: movie_purchase_option.id,
               user_id: user.id)

        subject
      end

      it_behaves_like 'can not rent a movie or season'
    end
  end

  context 'with invalid parameters' do
    context 'without user' do
      let(:expected_result) { { 'errors' => 'Invalid user' } }

      subject do
        post "/api/v1/purchase_options/#{movie_purchase_option.id}/purchases"
      end

      before { subject }

      it_behaves_like 'can not rent a movie or season'
    end

    context 'with an invalid purchase_option_id' do
      let(:expected_result) { { 'errors' => 'Invalid purchase_option_id' } }

      subject do
        post '/api/v1/purchase_options/999/purchases',
             params: { user_id: user.id }
      end

      before { subject }

      it_behaves_like 'can not rent a movie or season'
    end
  end
end
