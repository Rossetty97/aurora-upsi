class AddRiskManagementNormalOperationsToRams < ActiveRecord::Migration[5.2]
  def change
    add_column :rams, :risk_management_normal_operations_people, :text
    add_column :rams, :risk_management_normal_operations_equipment, :text
    add_column :rams, :risk_management_normal_operations_environment, :text
  end
end
