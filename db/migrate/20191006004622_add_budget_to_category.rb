class AddBudgetToCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :budget, null: false, foreign_key: true
  end
end
