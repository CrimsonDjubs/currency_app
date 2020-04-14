# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @exchange_rate = ExchangeRates::Fetch.new.call
  end
end
