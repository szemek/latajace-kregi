class FeedbacksController < ApplicationController
  def new
    feedback = Feedback.new

    render :new, locals: {feedback: feedback}
  end

  def create
    feedback = Feedback.new(feedback_params)
    feedback.user = current_user
    feedback.save

    redirect_to(thanks_feedback_path)
  end

  def thanks
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
