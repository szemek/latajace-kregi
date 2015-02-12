class EventDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def map
    content_tag(:iframe, nil, iframe_options.merge(src: map_url)) if location?
  end

  def iframe_options
    {
      width: 500,
      height: 400,
      frameborder: 0
    }
  end

  def map_url
    "#{google_maps_url}?q=#{location}&key=#{key}"
  end

  def google_maps_url
    "https://www.google.com/maps/embed/v1/place"
  end

  def key
    ENV['GOOGLE_MAPS_KEY']
  end
end
