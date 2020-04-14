require 'rails_helper'

RSpec.describe ShopSerializer do
  let(:publisher) { create :publisher }
  let!(:book1) { create :book, publisher: publisher, title: 'Book 1' }
  let!(:book2) { create :book, publisher: publisher, title: 'Book 2' }

  let!(:shop) { create :shop, id: 3, name: 'Shop 1', books_sold_count: 5 }

  let!(:shop_book1) { create :shop_book, shop: shop, book: book1, copies_in_stock: 4 }
  let!(:shop_book2) { create :shop_book, shop: shop, book: book2, copies_in_stock: 8 }

  describe 'serialized_record' do
    it 'return with books' do
      represented_shop = described_class.new(shop)
      expect(represented_shop.serialized_record).to(
        eq(
          id: 3,
          name: 'Shop 1',
          books_sold_count: 5,
          books_in_stock: [
            { 
              id: book1.id, 
              title: 'Book 1',
              copies_in_stock: 4
            }, 
            {
              id: book2.id, 
              title: 'Book 2',
              copies_in_stock: 8, 
            }
          ]
        )
      )
    end
  end

  context '.serialized_list' do
    let!(:book3) { create :book, publisher: publisher, title: 'Book 3' }

    let!(:shop2) { create :shop, id: 5, name: 'Shop 2', books_sold_count: 5 }

    let!(:shop_book3) { create :shop_book, shop: shop2, book: book3, copies_in_stock: 10 }

    it 'return 2 shops' do
      expect(described_class.new(Shop.all, is_collection: true).serialized_list).to eq(
        [
          {
            id: 3,
            name: 'Shop 1',
            books_sold_count: 5,
            books_in_stock: [
              { 
                id: book1.id, 
                title: 'Book 1',
                copies_in_stock: 4
              }, 
              {
                id: book2.id, 
                title: 'Book 2',
                copies_in_stock: 8, 
              }
            ]
          },
          {
            id: 5,
            name: 'Shop 2',
            books_sold_count: 5,
            books_in_stock: [
              { 
                id: book3.id, 
                title: 'Book 3',
                copies_in_stock: 10
              }
            ]
          }
        ]
      )
    end
  end
end
