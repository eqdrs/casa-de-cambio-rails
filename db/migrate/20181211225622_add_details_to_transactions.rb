class AddDetailsToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :amount, :decimal, precision: 8, scale: 2
    add_column :transactions, :quotation, :decimal, precision: 8, scale: 2
    add_column :transactions, :total, :decimal, precision: 8, scale: 2
  end
end
