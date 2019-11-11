class CreateReducers < ActiveRecord::Migration[5.2]
  def change
    create_table :reducers do |t|
      t.string :token, null: false
      t.string :url, null: false
      t.integer :count, null: false
      t.string :title

      t.timestamps
    end
    add_index :reducers, :token, unique: true
    add_index :reducers, :url, unique: true
  end
end
