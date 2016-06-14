class Store < OpenStruct
  attr_reader :service

  def initalize
    @service = BuyService.new
  end

  def store_information(zip)
    stores = service.close_stores_hash(zip)
    binding.pry
  end
end
