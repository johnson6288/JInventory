class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :products, :platforms
    add_foreign_key :products, :statuses
    add_foreign_key :products, :types
    add_foreign_key :products, :occasions
  end
end