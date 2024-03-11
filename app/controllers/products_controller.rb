 class ProductsController < ApplicationController
  before_action :authenticate_request

  def index
    @products = Product.all
    render json: @products, each_serializer: ProductSerializer
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.present?
     render json: @product, each_serializer: ProductSerializer
   else
    render json: {error: "not found"}, status: :not_found
  end
end



# def import_csv
#   if request.post?
#     Product.import_csv(params[:dump])
#     render json: { message: 'CSV file has been imported successfully.' }
#   else
#     render json: { error: 'Invalid request' }, status: :bad_request
#   end
# end


end
