class Api::CookiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_json_request

  # POST /api/cookies
  def create
    contact = Contact.where(email: params[:uid]).first
    cookie = Cookie.new(cookie_params)
    cookie.contact = contact
    if cookie.save
      render json: {}, status: :created
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def cookie_params
    new_params = params.require(:cookie).permit(:url, :accessTime)
    new_params[:access_time] = new_params[:accessTime]
    new_params.delete(:accessTime)
    new_params
  end

  def ensure_json_request
    return if request.format == :json
    render nothing: true, status: 406
  end
end
