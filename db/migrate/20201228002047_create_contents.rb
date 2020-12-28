class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :plot
      t.string :title
      t.references :parent, foreign_key: { to_table: :contents }
      t.integer :number, limit: 5
      t.string :type, null: false

      t.timestamps
    end
  end
end
