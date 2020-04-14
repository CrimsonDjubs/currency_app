require 'rails_helper'

RSpec.describe ShopListQuery do
  let(:publisher) { create :publisher }
  let!(:book1) { create :book, publisher: publisher, title: 'Book 1' }
  let!(:book2) { create :book, publisher: publisher, title: 'Book 2' }
  let!(:book3) { create :book, publisher: publisher, title: 'Book 3' }
  let!(:book4) { create :book, publisher: publisher, title: 'Book 4' }
  

  let!(:shop1) { create :shop, name: 'Shop 1', books: [book1, book2], books_sold_count: 10 }
  let!(:shop2) { create :shop, name: 'Shop 2', books: [book3, book4], books_sold_count: 5 }
  
 
  it '.call' do
    shops = described_class.new(publisher).call
    expect(shops.first.name).to eq('Shop 2')
    expect(shops.last.name).to eq('Shop 1')

    expect(shops.first.books.first.title).to eq('Book 3')
    expect(shops.first.books.last.title).to eq('Book 4')
    expect(shops.last.books.first.title).to eq('Book 1')
    expect(shops.last.books.last.title).to eq('Book 2')
  end
end
