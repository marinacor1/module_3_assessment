class BuyService
  def initialize
    @connection = Faraday.url("https://api.bestbuy.com/v1/")
    @connection.headers
  end

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end

  def get_close_stores(zip)
    @connection.get "lsdjf"
  end

end
