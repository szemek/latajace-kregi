require 'rails_helper'

describe MembersController do
  render_views

  describe '#index' do
    it 'renders successfully' do
      get :index

      expect(response.status).to eq(200)
    end
  end
end
