class CreateRams < ActiveRecord::Migration[5.2]
  def change
    create_table :rams do |t|
      t.string :ministry_group
      t.datetime :time_and_date
      t.string :location
      t.string :leaders_name
      t.string :activity
      t.string :num_of_leaders
      t.text :risks_description
      t.text :casual_factors_people
      t.string :casual_factors_equipment
      t.text :casual_factors_environment
      t.text :risk_management_emergency
      t.text :risk_management_normal_operations
      t.text :relevant_industry_standards_applicable
      t.text :skills_required_by_staff
      t.string :form_completed_by
      t.boolean :yes
      t.boolean :no
      t.string :approved_by
      t.string :position_in
      t.date :submision_date

      t.timestamps
    end
  end
end
