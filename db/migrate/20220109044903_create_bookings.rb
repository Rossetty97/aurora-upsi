class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :date_time
      t.text :payment_reference
      t.string :status, default: "Pending Descision"
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
