require 'rails_helper'


describe PeopleController do
  render_views

  context 'GET' do
    let!(:profile) { create(:profile) }

    context 'user is not logged in' do
      it 'redirects' do
        get :index

        expect(response.status).to eq(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'user is logged in' do
      it 'returns all profiles' do
        sign_in(profile.user)

        get :index

        expect(response.status).to eq(200)
        expect(response.body).to include(profile.fullname)
      end
    end
  end
end
