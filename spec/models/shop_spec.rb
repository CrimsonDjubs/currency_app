require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:publisher) { create :publisher }
  let(:book1) { create :book, publisher: publisher }
  let(:book2) { create :book, publisher: publisher }

  context 'create book' do
    it "with publisher's books" do
      shop1 = Shop.create!(name: 'Test Shop')
      shop2 = Shop.create!(name: 'Test Shop 2')

      shop1.shop_books.create!(book: book1)
      shop1.shop_books.create!(book: book2)
      
      expect(shop1.books.count).to eq(2)

      expect(shop1.name).to eq('Test Shop')
      expect(shop2.name).to eq('Test Shop 2')
    end
    
    it 'raise error without name' do
      expect{ Shop.create! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
      expect(Shop.count).to eq(0)
    end
  end
end

