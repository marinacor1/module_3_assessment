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
      type: store['storeType']}
    end
  end
end
