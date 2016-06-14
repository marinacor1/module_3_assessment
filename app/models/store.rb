class Store < OpenStruct
  attr_reader :service

  def initialize
    @service ||= BuyService.new
  end

  def store_information(zip)
    stores = service.close_stores_hash(zip)["stores"]
    stores.map do |store|
      {phone: store['phone'],
      name: store['longName'],
      distance: store['distance'],
      type: store['storeType'],
      city: store['city'],
      id: store['storeId'],
      zip: store['postalCode']}
    end
  end

  def one_store_info(zip, id)
    stores = service.close_stores_hash(zip)["stores"]
    store = stores.find do |store|
      store['storeId'] = id
    end
  end
end
