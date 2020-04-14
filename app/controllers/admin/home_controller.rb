# frozen_string_literal: true

class Admin::HomeController < ApplicationController
  def index
    @exchange_rate_form = ExchangeRateForm.new

    if forced_rate.present?
      @exchange_rate_form = ExchangeRateForm.new(
        rate: forced_rate[:rate],
        expires_at: forced_rate[:expires_at]
      )
    end
  end

  private

  def forced_rate
    @forced_rate = ExchangeRates::FetchForced.new.call
  end
end
