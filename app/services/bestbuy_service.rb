class BestbuyService
  attr_reader :zipcode, :api

  def initialize(zipcode)
    @zipcode = zipcode
    @api     = ENV['best_buy_api']
  end

  def self.stores(zipcode)
    new(zipcode).stores
  end

  def stores
    variables = "format=json&show=storeId,storeType,address,city,distance,name&pageSize=99&apiKey=#{api}"
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},30))?#{variables}")
    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    raw_stores
  end

end
