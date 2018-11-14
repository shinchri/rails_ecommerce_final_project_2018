# frozen_string_literal: true

ActiveAdmin.register Product do
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
  permit_params :name, :description, :level_id, :type_id, :price, :image

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Details' do
      f.input :level_id, as: :select, collection: Level.all.collect { |level| [level.description, level.id] }
      f.input :type_id, as: :select, collection: Type.all.collect { |type| [type.description, type.id] }
      f.input :name
      f.input :description
      f.input :price
      f.input :image
    end
    f.actions
  end
end
