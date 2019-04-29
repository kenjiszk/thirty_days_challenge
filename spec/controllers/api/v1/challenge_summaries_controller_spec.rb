require 'rails_helper'

describe Api::V1::ChallengeSummariesController, type: :controller do
  before(:each) do
    @user = create(:user)
    @challenge = create(:challenge, user_id: @user.id)
  end
  describe 'GET #show' do
    it 'not found' do
      get :show, params: { id: 100 }
      expect(response.status).to eq 404
    end
    it 'found' do
      create(:challenge_summary, challenge_id: @challenge.id)
      get :show, params: { id: @challenge.id }
      expect(response.status).to eq 200
    end
  end
  describe 'POST #create' do
    it 'create detail' do
      post :create, params: { challenge_id: @challenge.id, s3_key: 'https://aaa.com' }
      expect(response.status).to eq 201
    end
    it 'cannnot create create detail twice' do
      post :create, params: { challenge_id: @challenge.id, s3_key: 'https://aaa.com' }
      post :create, params: { challenge_id: @challenge.id, s3_key: 'https://aaa.com' }
      expect(response.status).to eq 400
    end
  end
end
