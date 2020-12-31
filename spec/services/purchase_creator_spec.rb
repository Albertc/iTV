# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseCreator, type: :service do
  describe '#call' do
    subject { described_class.new(user, purchase_option&.id).call }

    context 'with valid parameters' do
      let(:user) { create :user }
      let(:purchase_option) { FactoryBot.create(:purchasable_movie, :sd) }
      let(:expected_result) { { purchase: Purchase.last } }

      it 'create a new purchase' do
        expect { subject }.to change { Purchase.count }.by(1)
      end

      it 'returns a hash with the new purchase' do
        expect(subject).to eq(expected_result)
      end
    end

    context 'with invalid parameters' do
      shared_examples 'returning a hash with the error' do
        it 'does not create create a new purchase' do
          expect { subject }.not_to(change { Purchase.count })
        end

        it 'returns a hash with the errors' do
          expect(subject).to eq(expected_result)
        end
      end

      context 'with an invalid purchase_option_id' do
        let(:user) { create :user }
        let(:purchase_option) { nil }
        let(:expected_result) { { errors: 'Invalid purchase_option_id' } }

        it_behaves_like 'returning a hash with the error'
      end

      context 'with an invalid user' do
        let(:user) { nil }
        let(:purchase_option) { FactoryBot.create(:purchasable_movie, :sd) }
        let(:expected_result) { { errors: 'Invalid user' } }

        it_behaves_like 'returning a hash with the error'
      end
    end
  end
end
