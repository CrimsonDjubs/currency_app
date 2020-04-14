# frozen_string_literal: true

class ExchangeRatesWorker
  include Sidekiq::Worker

  def perform
    ExchangeRates::Fetch.new.call
  end
end
