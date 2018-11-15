# frozen_string_literal: true

ActiveAdmin.register Customer do
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

  permit_params :first_name, :last_name, :email, :address, :tax_rate_id

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :address
      f.input :tax_rate_id, as: :select, collection: TaxRate.all.collect { |rate| [rate.province_name, rate.id] }
    end
    f.actions
  end
end
