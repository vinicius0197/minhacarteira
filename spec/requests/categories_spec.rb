require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let(:user) { create(:user) }
  let!(:budget) { create(:budget, user_id: user.id) }
  let!(:category) { create(:category, budget_id: budget.id) }
  let(:budget_id) { budget.id }
  let(:headers) { valid_headers }

  describe 'GET /budgets/:id/categories' do
    before { get "/budgets/#{budget_id}/categories", params: {}, headers: headers }

    it 'returns categories from given budget' do
      expect(json).not_to be_empty
    end
  end
end