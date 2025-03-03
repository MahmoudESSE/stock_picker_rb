# frozen_string_literal: true

# Find best days to buy and sell stocks
# @param prices [Array<Integer>] An array of stock prices, one for each day
# @return [Array<Integer>] A pair of days [buy_day, sell_day] for maximum profit
def stock_picker(prices)
  initial_values = { max_profit: 0, best_days: [0, 0] }

  prices.each_with_index do |buy_price, buy_day|
    ((buy_day + 1)...prices.length).each do |sell_day|
      sell_price = prices[sell_day]
      profit = sell_price - buy_price

      initial_values[:max_profit] = profit unless profit < initial_values[:max_profit]
      initial_values[:best_days] = [buy_day, sell_day] unless profit < initial_values[:max_profit]
    end
  end

  initial_values[:best_days]
end

test_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
pp stock_picker(test_prices)
