class SearchController < ApplicationController
  def index
    @presenter = Presenter.new(params["search"]["zipcode"])
  end
end
