class FAQController < ApplicationController
  def show
    faq = FAQ.first_or_create
    render :show, locals: {faq: faq}
  end
end
