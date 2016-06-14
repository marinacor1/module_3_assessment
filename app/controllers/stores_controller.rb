class StoresController < ApplicationController
  def show
    @zip = params['q']
    binding.pry
    store = Store.new
    @stores = store.store_information(@zip)
  end
end
