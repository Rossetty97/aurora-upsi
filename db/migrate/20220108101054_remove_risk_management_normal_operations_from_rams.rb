class RemoveRiskManagementNormalOperationsFromRams < ActiveRecord::Migration[5.2]
  def change
    remove_column :rams, :risk_management_normal_operations, :text
  end
end
