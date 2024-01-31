class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.decimal :total_course_cost
      t.integer :installments_number
      t.integer :installments_due_day
      t.string :course_name
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
