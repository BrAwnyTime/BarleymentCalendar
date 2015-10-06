class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.text :description
    	t.boolean :all_day
    	t.datetime :start_datetime
    	t.datetime :end_datetime
      t.timestamps null: false
    end
  end
end
