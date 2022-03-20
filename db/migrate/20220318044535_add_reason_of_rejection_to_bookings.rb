class AddReasonOfRejectionToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :reason_of_rejections, :text
  end
end
