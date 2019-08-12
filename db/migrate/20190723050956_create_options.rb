class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :title
      t.float :price
      t.integer :minutes

      t.timestamps
    end
  end
end
