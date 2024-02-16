class AddActiveToInstitutions < ActiveRecord::Migration[7.1]
  def change
    add_column :institutions, :active, :boolean
  end
end
