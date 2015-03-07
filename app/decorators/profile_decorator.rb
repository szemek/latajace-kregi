class ProfileDecorator < Draper::Decorator
  delegate_all

  decorates_association :circle

  delegate :color_background, to: :circle, allow_nil: true

  def extended_info?
    skill_list.present? || interest_list.present? || webpage? || contact?
  end

  def filled?
    fullname.present?
  end
end
