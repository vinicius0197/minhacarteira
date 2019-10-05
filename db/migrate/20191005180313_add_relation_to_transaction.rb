class AddRelationToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :account, null: false, foreign_key: true
    add_reference :transactions, :sub_category, null: false, foreign_key: true
  end
end
