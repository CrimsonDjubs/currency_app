class ExchangeRateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'exchange_rate_channel'
  end
end
