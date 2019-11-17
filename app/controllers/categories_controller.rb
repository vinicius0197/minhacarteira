class CategoriesController < ApplicationController
  def index
    @categories = current_user.budgets.find(params["budget_id"]).categories
    json_response(@categories)
  end

  def create
    @category = current_user.budgets.find(params["budget_id"]).categories.create!(category_params)
    json_response(@category, :created)
  end


  private
  def category_params
    params.permit(:name)
  end
end
