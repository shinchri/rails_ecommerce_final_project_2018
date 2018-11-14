# frozen_string_literal: true

ActiveAdmin.register OrderItem do
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

  permit_params :price, :quantity, :product_id, :order_id

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :product_id, as: :select, collection: Product.all.collect { |product| [product.name, product.id] }
      f.input :order_id, as: :select, collection: Order.all.collect { |order| [order.id, order.id] }
      f.input :price
      f.input :quantity
    end
    f.actions
  end
end
