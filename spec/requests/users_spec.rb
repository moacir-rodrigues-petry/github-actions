require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      User.create!(name: 'John Doe', email: 'john@example.com')
      get :index
      expect(response).to be_successful
    end

    it 'returns all users as JSON' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response.first['name']).to eq(user.name)
      expect(json_response.first['email']).to eq(user.email)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'returns the user as JSON' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      get :show, params: { id: user.id }
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(user.name)
      expect(json_response['email']).to eq(user.email)
    end
  end

  describe 'POST #create' do
    it 'creates a new user' do
      expect do
        post :create, params: { user: { name: 'John Doe', email: 'john@example.com' } }
      end.to change(User, :count).by(1)
    end

    it 'returns the created user as JSON' do
      post :create, params: { user: { name: 'John Doe', email: 'john@example.com' } }
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq('John Doe')
      expect(json_response['email']).to eq('john@example.com')
    end

    it 'returns unprocessable entity status when invalid' do
      post :create, params: { user: { name: '', email: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT #update' do
    it 'updates the user' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      put :update, params: { id: user.id, user: { name: 'Jane Doe' } }
      user.reload
      expect(user.name).to eq('Jane Doe')
    end

    it 'returns the updated user as JSON' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      put :update, params: { id: user.id, user: { name: 'Jane Doe' } }
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq('Jane Doe')
    end

    it 'returns unprocessable entity status when invalid' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      put :update, params: { id: user.id, user: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      expect do
        delete :destroy, params: { id: user.id }
      end.to change(User, :count).by(-1)
    end

    it 'returns no content status' do
      user = User.create!(name: 'John Doe', email: 'john@example.com')
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
