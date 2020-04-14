# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExchangeRates::FetchForced do
  before do
    Redis.current.set(
      'forced_exchange_rate',
      {
        rate: 72,
        expires_at: Time.current
      }.to_json
    )
  end

  it 'return forced value' do
    result = described_class.new.call
    expect(result).to eq('rate' => 72, 'expires_at' => Time.current)
  end

end
