class CreateOccasions < ActiveRecord::Migration[6.0]
  def change
    create_table :occasions do |t|
      t.string :occasionName
      t.text :comments

      t.timestamps
    end
  end
end
