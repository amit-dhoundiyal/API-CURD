class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_number 
      t.float   :account_balance ,default: "0.0"
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
