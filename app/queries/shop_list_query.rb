class ShopListQuery
  def initialize(publisher)
    @publisher = publisher
  end

  def call
    Shop.joins(books: :publisher).where(books: { publisher: publisher }).ordered
  end

  private

  attr_reader :publisher
end
