class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.string :phone
      t.integer :gender
      t.integer :payment_method
      t.boolean :enabled, default: true
      
      t.timestamps
    end
  end
end
