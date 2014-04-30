module SaleUtil
  ##
  # Calculate the total cost of a list of items, taking into consideration discounts
  # @param [Array<Hash>] items
  # @return [Integer] The summation of all items, including discounts
  def sum_all_item_prices(items)
    items.map { |item| calculate_item_price(item) }.sum
  end

  ##
  # Computes the cost of a single item, taking into consideration discount price
  # @param [Object] item
  # @result [Integer] The final price, taking into consideration discount price
  def calculate_item_price(item)
    price = item['price'].to_f
    discount = item.fetch('discount', {'amount' => 0})['amount'].to_f

    price - discount
  end
end
