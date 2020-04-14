# frozen_string_literal: true

module ExchangeRates
  class CreateForced
    def initialize(exchange_rate_form)
      @exchange_rate_form = exchange_rate_form
    end

    def call
      exchange_rate = {
        rate: exchange_rate_form.rate,
        expires_at: exchange_rate_form.expires_at
      }.to_json

      Redis.current.set('forced_exchange_rate', exchange_rate)
      ActionCable.server.broadcast('exchange_rate_channel', content: exchange_rate)
    end

    private

    attr_reader :exchange_rate_form

    def exchange_rate
      {
        rate: exchange_rate_form.rate,
        expires_at: exchange_rate_form.expires_at
      }
    end
  end
end
