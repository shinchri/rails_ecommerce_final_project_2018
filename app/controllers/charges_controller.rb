class ChargesController < ApplicationController
  def new
    amount = session[:final_total].to_f.round(2)
    @amount =  amount * 100 # in cents
    @description = 'Description of Charges'
  end

  def create
    # Amount in cents
    amount = session[:final_total].to_f.round(2)
    @amount =  (amount * 100).to_i # in cents

    @customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    @customer_id = @customer.id

    @charge = Stripe::Charge.create(
      :customer    => @customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

    # tried to cast to Order
    @new_order = session[:new_order_object]

    # check if amount is equal to what we ordered and that it is paid
    if @charge.paid && @charge.amount == @amount
      id = session[:new_order_id].to_i
      @new_order_object = Order.find(id)
      @new_order_object.update(:payment_customer_id => @customer.id.to_s, :payment_id => @charge.id.to_s, :order_status_id => 2)

      #t.string "payment_customer_id"
      #t.string "payment_id"
      #@new_order.update(:payment_customer_id => @customer.id.to_s, :payment_id => @charge.id.to_s, :order_status_id => 2)
      #@order_status = OrderStatus.find(2)
      #@new_order.update(:order_status => @order_status)

      #@new_order.payment_customer_id = @customer.id.to_s
      #@new_order.payment_id = @charge.id.to_s
      #@new_order.order_status_id = 2
      #@new_order.save

      #@new_order_id = @new_order.id

      #@new_order.update_attributes(:payment_customer_id => @customer.id.to_s, :payment_id => @charge.id.to_s, :order_status_id => 2)
    else
      @new_order.destroy
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
