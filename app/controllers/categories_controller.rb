class CategoriesController < ApplicationController
  def index
    @categories = current_user.budgets.find(params["budget_id"]).categories
    json_response(@categories)
  end
end
