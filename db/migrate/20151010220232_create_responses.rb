class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :response, null: false

      t.references :user
      t.references :event
      t.timestamps null: false
    end
  
    add_index :responses, [:user_id, :event_id]
  end
end
