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
end
