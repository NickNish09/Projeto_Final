class AddCategoryIdToProtegories < ActiveRecord::Migration[5.0]
  def change
  	rename_column :protegories, :categorie_id, :category_id
  end
end
