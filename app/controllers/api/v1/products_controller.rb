class Api::V1::ProductsController < Api::ApiController
  def index
    render json: { products: Product.all.as_json }
  end
end
