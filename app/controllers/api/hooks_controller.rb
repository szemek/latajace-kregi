class Api::HooksController < Api::BaseController
  def email
    Email.create(email_params)

    render json: {}, status: :created
  end

  def email_params
    {
      from_name: params['FromName'],
      from: params['From'],
      subject: params['Subject'],
      html_body: params['HtmlBody'],
      text_body: params['TextBody']
    }
  end
end
