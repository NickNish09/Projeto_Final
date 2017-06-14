class ItemsCreate < ActiveRecord::Migration[5.0]
  def change
  	create_table :cart_items do |t|
    	#t.shopping_cart_item_fields
    	t.integer :owner_id       # Holds the owner id, for polymorphism
		t.string  :owner_type     # Holds the type of the owner, for polymorphism
		t.integer :quantity       # Holds the quantity of the object
		t.integer :item_id        # Holds the object id
		t.string  :item_type      # Holds the type of the object, for polymorphism
		t.integer :price_cents, default: 0, null: false  # Holds the price of the item
		t.string  :price_currency, default: "USD", null: false # Holds the currency for the price
  	    t.timestamps
  	end
  end
end
