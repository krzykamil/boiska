require 'rails_helper'

describe Admin::SessionsController, type: :controller do
  describe 'POST #create' do
    let!(:user1) { create :user, password: 'qwe', email: 'post@post.pl' }
    context 'when credientials is valid' do
      it 'redirect user to user page' do
        post :create, params: { email: 'post@post.pl', password: 'qwe' }
        expect(response).to redirect_to users_path
        expect(response).to have_http_status(:redirect)
      end
    end
    context 'when credientials is not valid' do
      it 'redirect user to login page' do
        post :create
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
