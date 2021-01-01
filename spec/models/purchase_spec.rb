# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:purchase_option) }

  describe '#duplicate purchase validation' do
    let(:user) { create :user }
    let!(:first_purchase) { create(:movie_purchase) }
    let(:second_purchase) do
      create(
        :movie_purchase,
        purchase_option_id: first_purchase.purchase_option.id
      )
    end

    describe 'Purchase the same item within 2 days' do
      it 'raises an RecordInvalid error and does not create a new Purchase ' do
        initial_count = Purchase.count

        expect{ second_purchase }.to raise_error(ActiveRecord::RecordInvalid)

        expect(Purchase.count).to eq(initial_count)
      end
    end

    describe 'Purchase the same item once the first is expired' do
      before do
        first_purchase.update(expired_at: Time.now - 1.day)
      end

      it 'does increment Purchase count by 1' do
        expect { second_purchase }.to change(Purchase, :count).by(1)
      end
    end
  end
end
