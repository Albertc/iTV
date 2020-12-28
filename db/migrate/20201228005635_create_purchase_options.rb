class CreatePurchaseOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_options do |t|
      t.decimal :price, precision: 5, scale: 2
      t.string :video_quality, limit: 2
      t.references :purchasable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
