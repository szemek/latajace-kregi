class ProfileDecorator < Draper::Decorator
  delegate_all

  decorates_association :circle

  delegate :color_background, to: :circle, allow_nil: true
end
