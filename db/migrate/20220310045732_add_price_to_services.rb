class AddPriceToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :price, :decimal, null: false
  end
end
