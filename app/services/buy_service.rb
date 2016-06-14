class BuyService
  def initialize
    @connection = Faraday.url("https://api.bestbuy.com/v1/")
    @connection.headers['apiKey'] = ENV['bb_key']
  end

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end

  def get_close_stores(zip)
    @connection.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,phone,storeType,longName,distance&pageSize=15&apiKey="ENV['bb_key']
  end

end
