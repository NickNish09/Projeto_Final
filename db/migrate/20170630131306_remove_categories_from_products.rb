class RemoveCategoriesFromProducts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :categories
  end
end
