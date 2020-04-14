# frozen_string_literal

class Admin::ExchangeRatesController < ApplicationController
  def update
    @exchange_rate_form = ExchangeRateForm.new(exchange_rate_params)

    return render :edit if @exchange_rate_form.invalid?

    ExchangeRates::CreateForced.new(@exchange_rate_form).call
    redirect_to admin_root_path
  end

  private

  def forced_rate
    @forced_rate = ExchangeRates::FetchForced.new.call
  end

  def exchange_rate_params
    params.require(:exchange_rate).permit(:rate, :expires_at)
  end
end
