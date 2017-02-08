class SetDefaults < ActiveRecord::Migration[5.0]
  def change
    remove_column :mixtapes, :rating_sum
    remove_column :mixtapes, :rating_count
    add_column :mixtapes, :rating_sum, :integer, default: 0
    add_column :mixtapes, :rating_count, :integer, default: 0
  end
end
