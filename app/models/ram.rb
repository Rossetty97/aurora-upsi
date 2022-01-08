class Ram < ApplicationRecord
  validates_presence_of :ministry_group, :time_and_date, :location, :leaders_name,:activity, :num_of_leaders, :risks_description, :casual_factors_people, :casual_factors_equipment, :casual_factors_environment, :risk_management_emergency, :risk_management_normal_operations_people, :risk_management_normal_operations_equipment, :risk_management_normal_operations_environment, :relevant_industry_standards_applicable, :skills_required_by_staff, :form_completed_by, :yes, :no, :approved_by, :position_in, :submision_date
end
