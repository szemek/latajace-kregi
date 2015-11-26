require 'rails_helper'

describe User do
  context '.where_with_order' do
    let(:users) do
      Array.new(5) { FactoryGirl.create(:user) }.shuffle
    end

    let(:collection) do
      User.where_with_order(id: users.map(&:id)).to_a
    end

    it 'returns collection with correct order' do
      users.each_with_index do |user, index|
        expect(collection[index]).to eq(user)
      end
    end
  end
end
