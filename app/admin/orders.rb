# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :customer_id, :order_status_id, :total, :total_tax, :payment_customer_id, :payment_id

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :customer_id, as: :select, collection: Customer.all.collect { |customer| [customer.email, customer.id] }
      f.input :order_status_id, as: :select, collection: OrderStatus.all.collect { |order_status| [order_status.status, order_status.id ]}
      f.input :total
      f.input :total_tax
      f.input :payment_customer_id
      f.input :payment_id
    end
    f.actions
  end
end
