class ReportsController < WebServiceController
  include SaleUtil
  include ArrayUtil

  def total_sales
    render json: {
        'number_of_sales' => Sale.count,
        'total' => Sale.all.map(&:total).sum
    }
  end

  def sales_per_item
    # Group all items by their name, and combine their sales information
    all_items = Sale.all.flat_map(&:items)
    grouped_by_name = all_items.group_by { |item| item['name'] }
    combined_items = grouped_by_name.map { |itemName, allItems| {
        itemName => {
            'total' => sum_all_item_prices(allItems),
            'number_of_sales' => allItems.count
        }
    }}

    result = merge_object_array(combined_items)

    render json: result
  end

end
