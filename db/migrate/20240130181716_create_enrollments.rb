class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.decimal :total_course_cost
      t.integer :invoices_number
      t.integer :invoices_due_day
      t.string :course_name
      t.references :institution, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
