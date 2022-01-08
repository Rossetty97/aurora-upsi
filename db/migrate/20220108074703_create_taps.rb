class CreateTaps < ActiveRecord::Migration[5.2]
  def change
    create_table :taps do |t|
      t.time :in_time
      t.time :out_time
      t.integer :usage, default: 0
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
