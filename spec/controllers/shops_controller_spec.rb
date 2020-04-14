require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
  let!(:publisher) { create :publisher }
  let!(:book1) { create :book, publisher: publisher, title: 'Book 1' }

  let!(:shop) { create :shop, id: 3, name: 'Shop 1', books_sold_count: 5 }

  let!(:shop_book1) { create :shop_book, shop: shop, book: book1, copies_in_stock: 4 }

  describe 'GET index' do
    it 'return success code' do
      get(:index, params: { publisher_id: publisher.id })
      expect(response.code).to eq('200')
    end

    it 'return error code if wrong publisher' do
      patch(:index, params: { publisher_id: -1 })
      expect(response.code).to eq('404')
    end
  end

  describe 'PATCH sell_book' do
    it 'return success code' do
      patch(:sell_book, params: { id: shop.id, book_id: book1.id, quantity: 3 })
      expect(response.code).to eq('200')
    end

    it 'return error code' do
      patch(:sell_book, params: { id: shop.id, book_id: book1.id, quantity: 5 })
      expect(response.code).to eq('400')
      expect(JSON.parse(response.body)).to eq({ 'errors'=> { 'quantity' => ['not enough copies in stock'] } })
    end
  end
end

