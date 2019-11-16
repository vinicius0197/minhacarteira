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

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /budget/:id/categories' do
    let(:valid_attributes) { { name: 'My Category', user_id: user.id.to_s }.to_json }

    context 'when the request is valid' do
      before { post "/budgets/#{budget_id}/categories", params: valid_attributes, headers: headers }
  
      it 'creates a category inside budget' do
        expect(json['name']).to eq('My Category')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  end
end