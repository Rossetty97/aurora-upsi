class AddUsageReminderToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :usage_reminder, :integer, null: false
  end
end
