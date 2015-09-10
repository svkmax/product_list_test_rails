class ProductsController < ApplicationController
  before_action :set_product, only: [:update]

  def index
    render json: Product.all
  end

  def update
    render @product.update(update_params) ? { json: @product } : {json: @product.reload, status: :unprocessable_entity}
  end

  private

  def update_params
    params.require(:product).permit(:name, :sku, :category)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end