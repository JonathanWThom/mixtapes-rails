class CreateInitialTables < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :reviews do |t|
      t.column :content, :string
      t.column :mixtape_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end

    create_table :mixtapes do |t|
      t.column :title, :string
      t.column :image, :string
      t.column :subgenre, :string
      t.column :year, :integer
      t.column :rating_sum, :integer
      t.column :rating_count, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
