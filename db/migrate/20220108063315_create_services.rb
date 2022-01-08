class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :capacity, default: 0
      t.integer :current_usage, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
