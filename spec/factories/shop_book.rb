FactoryBot.define do
  factory :shop_book do
    shop
    book
    copies_in_stock { 0 }
  end
end
