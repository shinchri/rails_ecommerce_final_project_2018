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

    if(@new_customer.save)
      # saved!!!
      @message = 'saved!'
    else
      @message = 'failed to save!'
    end

    @total_price = @cart_items.sum(&:price)
    @total_tax = (@new_customer.tax_rate.gst + @new_customer.tax_rate.pst + @new_customer.tax_rate.hst) * @total_price
    @final_total = @total_price + @total_tax
    session[:final_total] = @final_total

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

    session[:new_order_object] = @new_order
    session[:new_order_id] ||=0
    session[:new_order_id] = @new_order.id.to_i

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
