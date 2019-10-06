class AddBudgetToAccount < ActiveRecord::Migration[6.0]
  def change
    add_reference :accounts, :budget, null: false, foreign_key: true
  end
end
