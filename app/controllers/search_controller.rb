class SearchController < ApplicationController
  def index
    @zip = params['q']
    store = Store.new
    @stores = store.store_information(@zip)
    @count = @stores.count
  end

  def show
    store = Store.new
    @specific_store = store.one_store_info(params['zip'], params['id'])
  end

end
