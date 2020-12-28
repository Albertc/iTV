# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EpisodePresenter do

  describe '#present' do
    let(:episode) { create(:episode, :with_season) }

    let(:expected_result) do
      {
        id: episode.id,
        number: episode.number,
        title: episode.title,
        plot: episode.plot
      }
    end

    subject { described_class.new(episode).present }

    it 'returns valid hash' do
      is_expected.to eq(expected_result)
    end
  end
end
