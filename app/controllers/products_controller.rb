class ProductsController < ApplicationController
  before_action :set_product, only: [:update]

  def index
    render json: {products: Product.paginate(:page => params[:page_number],
                                             :per_page => params[:per_page]),
                  total: Product.count}
  end

  def filter
    scope = Product.where("category like ?", "%#{params[:filter]}%")
    render json: {products: scope.paginate(:page => params[:page_number],
                                           :per_page => params[:per_page]),
                  total: scope.count}
  end

  def count
    render json: Product.count
  end

  def update
    render @product.update(update_params) ? {json: @product} : {json: @product.reload, status: :unprocessable_entity}
  end

  private

  def update_params
    params.require(:product).permit(:name, :sku, :category)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end