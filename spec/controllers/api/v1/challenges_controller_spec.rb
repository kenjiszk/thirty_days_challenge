require 'rails_helper'

describe Api::V1::ChallengesController, type: :controller do
  before(:each) do
    @user = create(:user)
  end
  describe 'POST #create' do
    it 'create challenge' do
      post :create, params: { uuid: 'aaaaaaaa', name: 'Challenge1', format: 'movie' }
      expect(response.status).to eq 201
    end
    it 'dupulicate challenge' do
      post :create, params: { uuid: 'aaaaaaaa', name: 'Challenge1', format: 'movie' }
      post :create, params: { uuid: 'aaaaaaaa', name: 'Challenge1', format: 'movie' }
      expect(response.status).to eq 400
    end
    it 'no user' do
      post :create, params: { uuid: 'bbbbbbbb', name: 'Challenge1', format: 'movie' }
      expect(response.status).to eq 400
    end
  end
  describe 'GET #details' do
    it 'get empty challenge' do
      get :details, params: {challenge_id: @user.id}
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['details'].count).to eq 0
    end
    it 'get challenges' do
      challenge = create(:challenge, user_id: @user.id)
      create(:challenge_detail, challenge_id: challenge.id)
      get :details, params: {challenge_id: @user.id}
      expect(JSON.parse(response.body)['details'].count).to eq 1
    end
  end
end
