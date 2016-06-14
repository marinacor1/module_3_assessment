class SearchController < ApplicationController

  def index
    @zip = params['q']
    store = Store.new
    @stores = store.store_information(@zip)
    @count = @stores.count
  end

end
