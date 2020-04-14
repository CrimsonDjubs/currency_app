require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:publisher) { create :publisher }

  context 'create shop' do
    it 'with publisher' do
      book1 = Book.create!(title: 'Test Book', publisher: publisher)
      book2 = Book.create!(title: 'Test Book 2', publisher: publisher)

      expect(book1.title).to eq('Test Book')
      expect(book2.title).to eq('Test Book 2')
    end

    it 'raise error without title' do
      expect{ Book.create!(publisher: publisher) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
      expect(Book.count).to eq(0)
    end
  end
end
