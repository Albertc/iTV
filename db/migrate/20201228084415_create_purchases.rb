class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.date :expired_at
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :purchase_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
