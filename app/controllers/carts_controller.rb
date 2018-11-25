class CartsController < ApplicationController
  def index
  end

  def clear_shopping_cart_lists
    session[:product_id] = []
    session[:quantity] = []
    redirect_to action: 'index'
  end

  # create a new customer using the data entered by the clients
  # create a order
  # create a order_items using the product
  def checkout

    @new_customer = Customer.new(
      first_name: params[:customer][:first_name],
      last_name: params[:customer][:last_name],
      email: params[:customer][:email],
      address: params[:customer][:address],
      tax_rate_id: params[:customer][:tax_rate_id]
    )

    @params = params

    if(@new_customer.save)
      # saved!!!
      @message = 'saved!'
    else
      @message = 'failed to save!'
    end

    @total_price = @cart_items.sum(&:price)
    @total_tax = (@new_customer.tax_rate.gst + @new_customer.tax_rate.pst) * @total_price
    @final_total = @total_price + @total_tax

    #creating new order
    @new_order = Order.new(
      customer: @new_customer,
      total: @total_price,
      total_tax: @total_tax,
      order_status_id: 1
    )

    if(@new_order.save)
      # saved!!!
      @message_order = 'saved!'
    else
      @message_order = 'failed to save!'
    end

    # order_items
    # t.decimal "price"
    # t.integer "quantity"
    # t.integer "product_id"
    # t.integer "order_id"

    #product
    # t.string "name"
    # t.text "description"
    # t.integer "level_id"
    # t.integer "type_id"
    # t.decimal "price"
    # t.string "image"

    #loop through the cart_items

    @cart_items.each do |item|
      @new_order_item = OrderItem.new(
        price: item.price,
        quantity: 1,
        product: item,
        order: @new_order
      )

      if(@new_order_item.save)
        # saved!!!
        @message_order_item = 'saved!'
      else
        @message_order_item = 'failed to save!'
      end

    end

    #redirect_to action: 'index'
  end
end
