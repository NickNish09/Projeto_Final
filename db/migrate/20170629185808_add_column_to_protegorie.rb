class AddColumnToProtegorie < ActiveRecord::Migration[5.0]
  def change
  	add_column :protegories, :product_id, :integer
  	add_column :protegories, :categorie_id, :integer
  end
end
