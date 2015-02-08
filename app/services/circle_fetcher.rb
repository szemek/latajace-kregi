class CircleFetcher
  def self.all
    self.new.all
  end

  def all
    circles.decorate
  end

  private

  def circles
    @circles ||= Circle.visible.order(:position)
  end
end
