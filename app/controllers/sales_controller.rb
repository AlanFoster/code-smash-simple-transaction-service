class SalesController < WebServiceController
  include SaleUtil

  def index
    sales = Sale.all
    render json: sales
  end

  def show
    sale = Sale.find params['id']
    render json: sale
  end

  def create
    sale = params['sale']
    sale_with_total = sale.merge('total' => sum_all_item_prices(sale['items']))

    inserted_sale = Sale.create sale_with_total
    render json: inserted_sale
  end
end
