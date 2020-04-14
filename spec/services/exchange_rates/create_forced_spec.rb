# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExchangeRates::CreateForced do
  include ActiveSupport::Testing::TimeHelpers

  describe 'create' do
    let(:form) do
      ExchangeRateForm.new(rate: 75, expires_at: Time.now + 20.minutes)
    end

    it 'with forced' do
      freeze_time do
        described_class.new(form).call
        expected_result = JSON.parse(Redis.current.get('forced_exchange_rate'))
        expect(expected_result).to eq(
          'rate' => 75,
          'expires_at' => (Time.now + 20.minutes).as_json
        )
      end
    end
  end
end
