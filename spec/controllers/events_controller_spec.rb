require 'rails_helper'

describe EventsController do
  render_views

  describe '#index' do
    before do
      FactoryGirl.create(:event)
    end

    it 'renders successfully' do
      get :index

      expect(response.status).to eq(200)
    end
  end
end
