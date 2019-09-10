require 'rails_helper'

describe Api::V1::ChallengeDetailsController, type: :controller do
  before(:each) do
    @user = create(:user)
    @challenge = create(:challenge, user_id: @user.id)
    @challenge_detail = create(:challenge_detail, challenge_id: @challenge.id)
  end
  describe 'GET #show' do
    it 'not found' do
      get :show, params: { id: 100 }
      expect(response.status).to eq 404
    end
    it 'found' do
      get :show, params: { id: @challenge_detail.id }
      expect(response.status).to eq 200
    end
  end
  describe 'POST #create' do
    it 'create detail' do
      post :create, params: { challenge_id: @challenge.id, frame_num: 0, url: 'https://aaa.com', date: '2019/04/29' }
      expect(response.status).to eq 201
    end
    it '2nd create detail' do
      post :create, params: { challenge_id: @challenge.id, frame_num: 1, url: 'https://aaa.com', date: '2019/04/29' }
      post :create, params: { challenge_id: @challenge.id, frame_num: 1, url: 'https://bbb.com', date: '2019/04/29' }
      expect(response.status).to eq 201
    end
  end
  describe 'PATCH #update' do
    it 'update comment' do
      patch :update, params: { id: @challenge_detail.id, comment: 'aaaaaaaaaaa' }
      expect(response.status).to eq 200
    end
    it 'details not found' do
      patch :update, params: { id: 100, comment: 'aaaaaaaaaaa' }
      expect(response.status).to eq 404
    end
  end
end
