require 'httparty'
require 'json'

def crypto_data
    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
    response = HTTParty.get(url)
    JSON.parse(response.body)
end

def sort_by_market_cap(cryptos)
    cryptos.sort_by { |crypto| -crypto['market_cap'] }
end

def display_top_5(cryptos)
    puts 'Top 5 Cryptocurrencies by Market Capitalization:'
    cryptos.first(5).each_with_index do |crypto, index|
      puts "##{index + 1}: #{crypto['name']} - Price: $#{crypto['current_price']} - Market Cap: $#{crypto['market_cap']}"
    end
  end

cryptos = crypto_data
sorted_cryptos = sort_by_market_cap(cryptos)
display_top_5(sorted_cryptos)
