class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :currency
      t.string :transaction_type

      t.timestamps
    end
  end
end
