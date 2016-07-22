class AddDbIndices < ActiveRecord::Migration
  def change
    add_index :brands_stores, :brand_id
    add_index :brands_stores, :store_id
    add_index :brands, :name
  end
end
