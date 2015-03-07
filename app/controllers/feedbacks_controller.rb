class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    feedback = Feedback.new

    render :new, locals: {feedback: feedback}
  end

  def create
    current_user.feedbacks.create(feedback_params)

    redirect_to(thanks_feedback_path)
  end

  def thanks
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
