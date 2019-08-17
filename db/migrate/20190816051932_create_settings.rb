class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :days_availability
      t.string :start_time
      t.string :end_time
      t.integer :interval
      t.integer :duration

      t.timestamps
    end
  end
end
