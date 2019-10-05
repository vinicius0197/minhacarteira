class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :inflow
      t.decimal :outflow

      t.timestamps
    end
  end
end
