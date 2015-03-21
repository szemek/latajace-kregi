require 'rails_helper'


describe MembersController do
  render_views

  describe '#index' do
    let!(:profile) { create(:profile) }

    it 'renders created profile' do
      get :index

      expect(response.status).to eq(200)
      expect(response.body).to include(profile.fullname)
    end
  end

  describe '#show' do
    let(:webpage) { 'http://about.me' }
    let!(:profile) { create(:profile, webpage: webpage) }

    context 'user is not signed in' do
      it 'renders created profile without extended info' do
        get :show, id: profile.id

        expect(response.status).to eq(200)
        expect(response.body).to include(profile.fullname)
        expect(response.body).to_not include(webpage)
      end
    end

    context 'user is signed in' do
      it 'renders created profile with extended info' do
        sign_in(profile.user)

        get :show, id: profile.id

        expect(response.status).to eq(200)
        expect(response.body).to include(profile.fullname)
        expect(response.body).to include(webpage)
      end
    end
  end
end
