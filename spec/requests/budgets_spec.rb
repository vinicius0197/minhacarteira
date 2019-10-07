require 'rails_helper'

RSpec.describe 'Budget API', type: :request do
  let(:user) { create(:user) }
  let!(:budget) { create(:budget, user_id: user.id) }
  let(:budget_id) { budget.id }
  let(:headers) { valid_headers }

  describe 'GET /budgets' do
    before { get '/budgets', params: {}, headers: headers }

    it 'returns budgets' do
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /budgets/:id' do
    before { get "/budgets/#{budget_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the budget' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(budget_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:budget_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /budgets' do
    # valid payload
    let(:valid_attributes) { { name: 'My Budget', user_id: user.id.to_s }.to_json }

    context 'when the request is valid' do
      before { post '/budgets', params: valid_attributes, headers: headers }

      it 'creates a budget' do
        expect(json['name']).to eq('My Budget')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { name: nil }.to_json }
      before { post '/budgets', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /budgets/:id' do
    let(:valid_attributes) { { name: 'My new budget' }.to_json }
    
    context 'when the record exists' do
      before { put "/budgets/#{budget_id}", params: valid_attributes, headers: headers }
      
      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /budgets/:id' do
    before { delete "/budgets/#{budget_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response). to have_http_status(204)
    end
  end
end