class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.decimal :invoice_value
      t.date :due_date
      t.integer :status, default: 0
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
