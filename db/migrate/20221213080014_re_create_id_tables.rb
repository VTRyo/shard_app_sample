class ReCreateIdTables < ActiveRecord::Migration[7.0]
  def change
    create_table :id_tables, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY'
      t.string :table_name

      t.timestamps
    end
  end
end
