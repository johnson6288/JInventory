class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :productName
      t.integer :platform_id
      t.integer :status_id
      t.integer :type_id
      t.text :comments

      t.timestamps
    end
  end
end
