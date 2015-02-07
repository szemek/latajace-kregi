require 'rails_helper'


describe PeopleController do
  render_views

  context 'GET' do
    let!(:profile) { create(:profile) }

    it 'returns all profiles' do
      get :index

      expect(response.status).to eq(200)
      expect(response.body).to include(profile.fullname)
    end
  end
end
