class Store < ApplicationRecord
  attr_reader :store_id, :store_type, :name, :address, :city, :distance

  def initialize(attrs)
    @store_id = attrs[:storeId]
    @store_type = attrs[:storeType]
    @name = attrs[:name]
    @address = attrs[:address]
    @city = attrs[:city]
    @distance = attrs[:distance]
  end

  def self.stores(zipcode)
    BestbuyService.stores(zipcode).map do |raw_store|
      Store.new(raw_store)
    end
  end
end
