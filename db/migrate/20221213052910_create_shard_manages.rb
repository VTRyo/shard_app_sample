class CreateShardManages < ActiveRecord::Migration[7.0]
  def change
    create_table :shard_manages do |t|
      t.integer :office_id
      t.string :shard_name

      t.timestamps
    end
  end
end
