class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY'
      t.string :name
      t.integer :office_id

      t.timestamps
    end
  end
end
