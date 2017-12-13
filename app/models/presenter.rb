class Presenter

  attr_reader :zipcode
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def stores
    Store.stores(zipcode)
  end

end
