class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :update, :destroy]

  def index
    @budgets = Budget.all
    json_response(@budgets)
  end

  def create
    @budget = Budget.create!(budget_params)
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
    params.permit(:name, :user_id)
  end

  def set_budget
    @budget = Budget.find(params[:id])
  end
end
