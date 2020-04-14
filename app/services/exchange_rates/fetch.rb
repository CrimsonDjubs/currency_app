# frozen_string_literal: true

module ExchangeRates
  class Fetch < Base
    def call
      return forced_rate[:rate] if active_forced?

      ExchangeRates::Parse.new.call
    end

    private

    def active_forced?
      forced_rate[:expires_at].to_datetime > Time.current
    end

    def forced_rate
      @forced_rate ||= ExchangeRates::FetchForced.new.call
    end
  end
end
