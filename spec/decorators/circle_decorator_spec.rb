require 'spec_helper'
require 'draper'
require_relative '../../app/decorators/circle_decorator'

describe CircleDecorator do

  it 'returns proper color_background' do
    circle = described_class.new(double(color: 'blue'))

    expect(circle.color_background).to eq('background: blue')
  end

  context 'cover is present' do
    it 'returns proper cover_background' do
      circle = described_class.new(double(cover: 'photo.jpg', cover?: true))

      expect(circle.cover_background).to eq('background: url(photo.jpg)')
    end
  end

  context 'cover is missing' do
    it 'returns nil for cover_background' do
      circle = described_class.new(double(cover?: false))

      expect(circle.cover_background).to eq(nil)
    end
  end
end
