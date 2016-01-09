require 'rails_helper'

describe MembersController do
  render_views

  let!(:user) { FactoryGirl.create(:user, skill_list: ['programming'], interest_list: ['cooking']) }

  describe '#index' do
    it 'renders successfully and contains user name' do
      get :index

      expect(response.status).to eq(200)

      expect(response.body).to include(user.fullname)
    end
  end

  describe '#show' do
    before do
      sign_in(user)
    end

    it 'displays user details' do
      get :show, id: user.id

      expect(response.status).to eq(200)

      expect(response.body).to include('programming')
      expect(response.body).to include('cooking')
    end
  end
end
