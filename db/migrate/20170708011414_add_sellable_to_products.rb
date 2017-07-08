class AddSellableToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :sellable, :boolean,default: true
  end
end
