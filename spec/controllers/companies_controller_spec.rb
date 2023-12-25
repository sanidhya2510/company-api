# spec/controllers/companies_controller_spec.rb

require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'GET #show' do
    context 'when company is not found' do
      it 'renders a JSON error response' do
        user = create(:user)  # Use FactoryBot to create a user
        sign_in user  # Sign in the user

        get :show, params: { id: 999, format: :json }

        expect(response).to have_http_status(:not_found)
        expect(response.content_type).to include('application/json')

        json_response = JSON.parse(response.body)
        expect(json_response).to include('error' => 'Company not found')
      end
    end
  end

  describe 'POST #create' do
    it 'returns a JSON error response when input is missing' do
      user = create(:user)  # Assuming you have a user factory
      sign_in user

      post :create, params: { company: { name: '', location: '' }, format: :json }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({ 'error' => 'Name and location cannot be empty' })
    end

    it 'creates a new company and redirects to the main page when input is valid' do
      user = create(:user, role: :admin)  # Assuming you have a user factory with admin role
      sign_in user

      post :create, params: { company: { name: 'Example Company', location: 'City' } }

      expect(response).to redirect_to(companies_path)
      expect(flash[:notice]).to eq('Company was successfully created.')
    end
  end
end
