require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  before(:each) do
    @user = create(:user)
  end
  describe 'GET #show' do
    it 'user found' do
      get :show, params: { uuid: 'aaaaaaaa'}
      expect(response.status).to eq 200
    end
    it 'user not found' do
      get :show, params: { uuid: 'bbbbbbbb'}
      expect(response.status).to eq 404
    end
  end
  describe 'POST #create' do
    it 'duplicate user create' do
      post :create, params: { uuid: 'aaaaaaaa' }
      expect(response.status).to eq 400
    end
    it 'user create' do
      post :create, params: { uuid: 'bbbbbbbb' }
      expect(response.status).to eq 201
    end
  end
  describe 'GET #challenges' do
    it 'get challenge' do
      create(:challenge, user_id: @user.id)
      get :challenges, params: { user_uuid: 'aaaaaaaa'}
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['challenges'].count).to eq 1
    end
    it 'get empty challenge' do
      create(:user, uuid: 'bbbbbbbb')
      get :challenges, params: { user_uuid: 'bbbbbbbb'}
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['challenges'].count).to eq 0
    end
    it 'get no user challenge' do
      get :challenges, params: { user_uuid: 'cccccccc'}
      expect(response.status).to eq 400
    end
  end
end
