class SearchController < ApplicationController
  def index
    #zipcode = params["search"]["zipcode"]
    zipcode = "55423"
    api = ENV['best_buy_api']
    variables = "format=json&show=storeId,storeType,address,city,distance,name&pageSize=99&apiKey=#{api}"
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},30))?#{variables}")
    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    @stores =raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
  end
end
