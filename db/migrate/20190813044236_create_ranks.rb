class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks do |t|
      t.date :result_date, null: false
      t.integer :category_id, null: false
      t.json :items, default: '{}'

      t.timestamps
    end
  end
end
