class OrdersController < ApplicationController
	require 'securerandom'
  before_action :authenticate_request
       
  def index
    @orders = Order.all
    render json: @orders, each_serializer: OrderSerializer
  end 

  def show 
   # @order = Order.find_by(id: params[:id]
    @order = @current_user.orders.find_by(id: params[:id])
      if @order.present?
        render json: @order, each_serializer: OrderSerializer
      else
        render json: {error: "Order not found"}, status: :unauthorized
      end
  end  

  def create
    @products = @current_user.cart.products
    @order = Order.new(
     		           user_id: @current_user.id,
     		           order_number: generate_order_number,
                   total_mrp: calculate_total_mrp, 
                   total_price: calculate_total_price, 
                   discount: calculate_discount,
                   tax: calculate_tax,
                   payment_method: params[:payment_method],
                   address_id: params[:address_id]   
                   )
     	    if @order.save
                @order.products << @products
                @products.destroy_all
                render json: @order, each_serializer: OrderSerializer
     		      # render json: { message: 'Order placed successfully', order: serialize_order(order) }
     	    else
     		   render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
          end
  end

  private

  # def serialize_order(order)
  #   debugger
  #    {
  #     id: order.id,
  #     user_id: order.user_id,
  #     order_number: order.order_number,
  #     total_mrp: order.total_mrp.to_s,
  #     total_price: order.total_price.to_s,
  #     discount: order.discount.to_s,
  #     tax: order.tax.to_s,
  #     payment_method: order.payment_method,
  #     created_at: order.created_at,
  #     updated_at: order.updated_at,
  #     address: {
  #       id: order.address.id,
  #       street: order.address.street_address,
  #       city: order.address.city,
  #       state: order.address.state,
  #       zip_code: order.address.zip_code
  #     },
  #     status: order.status,
  #     products: order.products.map { |product| serialize_product(product) }
  #   }
  # end
  # def serialize_product(product)
  #   debugger
  #   {
  #     product_id: product.id,
  #     title: product.title,
  #     description: product.description,
  #     mrp: product.mrp.to_s,
  #     price: product.price.to_s
  #   }
  # end
  def generate_order_number
    # order_number = 5.times.map { [*0..9   ].sample }.join.to_i
      order_number = SecureRandom.hex(3).to_i(16) % 1_000_000
      if @order && @order.respond_to?(:number)
        elf.class.find_by(order_number: @order.number) ? 
        generate_order_number : order_number
      else
        order_number
      end 
  end

  def calculate_total_mrp
    # @cart = Cart.find_by(id: params[:cart_id])
    # return 0 if @cart.nil?
      @total_mrp = @products.sum(:mrp)
    # @cart.products.each { |product| @order.products << product }
      return @total_mrp
   end

  def calculate_total_price
    # @cart = Cart.find_by(id: params[:cart_id])
    # return 0 if @cart.nil?
      @total_price = @products.sum(:price)
      return @total_price

  end

  def calculate_discount

      total_mrp = calculate_total_mrp
      total_price = calculate_total_price
      discount_percentage = 100.0

      discount_amount = ((total_mrp - total_price)*(discount_percentage/100)).round(2)

    # for check discount amount not negative 
      discount_amount = [discount_amount,0].max

      discount_amount

  end

  def calculate_tax
      tax_percentage = 5.0
      total_price = calculate_total_price

      tax_amount = (total_price * (tax_percentage/100)).round(2)
      tax_amount

  end
end
