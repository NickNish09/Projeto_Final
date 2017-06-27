class AddDeliveryDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :deliverydate, :date
  end
end
