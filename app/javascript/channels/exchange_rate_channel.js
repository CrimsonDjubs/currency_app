import consumer from "./consumer"

consumer.subscriptions.create("ExchangeRateChannel", {
  connected() {
    console.log("Connected to the exchange rate!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    data = JSON.parse(data.content)
    $('.exchange-rate .rub').html(data.rate)
  }
});
