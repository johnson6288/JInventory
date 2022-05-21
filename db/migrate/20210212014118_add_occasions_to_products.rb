class AddOccasionsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :occasion_id, :integer
  end
end
