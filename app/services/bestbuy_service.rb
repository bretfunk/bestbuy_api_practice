class BestbuyService
  attr_reader :zipcode, :api, :initial

  def initialize(zipcode)
    @zipcode = zipcode
    @api     = ENV['best_buy_api']
    @initial = "https://api.bestbuy.com/v1/stores"
  end

  def self.stores(zipcode)
    new(zipcode).stores
  end

  def stores
    variables = "format=json&show=storeId,storeType,address,city,distance,name&pageSize=99&apiKey=#{api}"
    faraday("#{initial}(area(#{zipcode},30))?#{variables}")
  end

  def faraday(request)
    parse(Faraday.get(request))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
