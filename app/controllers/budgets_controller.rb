class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :update, :destroy]

  def index
    @budgets = current_user.budgets
    json_response(@budgets)
  end

  def create
    @budget = current_user.budgets.create!(budget_params)
    json_response(@budget, :created)
  end

  def show
    json_response(@budget)
  end

  def update
    @budget.update(budget_params)
  end

  def destroy
    @budget.destroy
    head :no_content
  end

  private

  def budget_params
    params.permit(:name)
  end

  def set_budget
    @budget = Budget.find(params[:id])
  end
end
