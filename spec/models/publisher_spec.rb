require 'rails_helper'

RSpec.describe Publisher, type: :model do
  context 'create publisher' do
    it 'with books' do
      publisher = create(:publisher, name: 'Test Publisher')
      book1 = publisher.books.create!(title: 'Test Title')
      book2 = publisher.books.create!(title: 'Test Title 2')

      expect(publisher.name).to eq('Test Publisher')
      expect(publisher.reload.books).to eq([book1, book2])
    end

    it 'not create with empty name' do
      expect{ Publisher.create! }.to(
        raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
      )
      expect(Publisher.count).to eq(0)
    end
  end
end
