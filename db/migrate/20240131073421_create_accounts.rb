class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :account_number, null: false
      t.decimal :balance, precision: 10, scale: 2, default: 0.0

      t.timestamps

      t.index :account_number, unique: true
    end
  end
end
