class ChangeToDecimals < ActiveRecord::Migration[5.0]
  def change
    remove_column :mixtapes, :rating_sum
    add_column :mixtapes, :rating_sum, :decimal, default: 0
  end
end
