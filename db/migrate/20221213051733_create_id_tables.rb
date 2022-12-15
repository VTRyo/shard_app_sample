class CreateIdTables < ActiveRecord::Migration[7.0]
  def change
    create_table :id_tables do |t|
      t.string :table_name

      t.timestamps
    end
  end
end
