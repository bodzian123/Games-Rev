require 'rails_helper'
RSpec.describe Api::SessionsController, type: [:controller, :api] do
  describe 'POST #login' do
    context 'with valid email and password' do
      before :all do
        pass = Faker::Internet.password
        @user = create(:user, password: pass)
        post api_session_path, user: {email: @user.email, password: pass}, format: :json
      end
      it 'should return new token of located user' do
        @user.reload
        expect(last_response.body['user']).to be_present
        expect(JSON.parse(last_response.body)['user']['authentication_token']).to eq @user.authentication_token
        expect(JSON.parse(last_response.body)['user']['id']).to eq @user.id
      end
      it 'should have a success http status' do
        expect(last_response.status).to eq 200
      end
    end
    context 'with incorrect params' do
      before do
        user = create(:user)
        post api_session_path, user: {email: user.email, password: ''}, format: :json
      end
      it 'should assign user as nil' do
        expect(assigns[:user]).to be_nil
      end
      it 'should have an unauthorized http status' do
        expect(last_response.status).to eq 401
      end
    end
  end
end
