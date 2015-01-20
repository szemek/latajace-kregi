class CircleFetcher
  def self.all
    self.new.all
  end

  def all
    circles.decorate.slice_when(&pattern)
  end

  private

  def circles
    @circles ||= Circle.order(:position)
  end

  def pattern
    lambda { |element, _| element.position % 7 == 0 || (element.position % 7) % 4 == 0 }
  end
end
