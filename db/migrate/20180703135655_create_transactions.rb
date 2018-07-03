class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :from
      t.string :to
      t.string :description
      t.string :typeof
      t.float :amount, default: "0.0"
      t.references :account,foreign_key: true

      t.timestamps
    end
  end
end
