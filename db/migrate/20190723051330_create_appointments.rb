class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :client, foreign_key: true
      t.references :option, foreign_key: true
      t.string :stripe_id
      t.text :content
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
