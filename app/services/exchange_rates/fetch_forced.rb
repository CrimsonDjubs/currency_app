# frozen_string_literal: true

module ExchangeRates
  class FetchForced
    def call
      return if rate.blank?

      JSON.parse(rate).symbolize_keys
    end

    private

    def rate
      @rate ||= Redis.current.get('forced_exchange_rate')
    end
  end
end
