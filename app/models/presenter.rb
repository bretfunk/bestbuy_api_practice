class Presenter

  attr_reader :zipcode
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def stores
    Store.stores(zipcode)
  end

  def total
    Store.total(zipcode)
  end
end
