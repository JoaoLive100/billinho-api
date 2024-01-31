class CreateInstitutions < ActiveRecord::Migration[7.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :cnpj
      t.integer :kind

      t.timestamps
    end
  end
end
