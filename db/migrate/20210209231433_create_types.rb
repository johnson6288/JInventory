class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :typeName
      t.text :comments

      t.timestamps
    end
  end
end
