class Api::CookiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_json_request

  def create
    if Cookie.create(cookie_params)
      render json: {}, status: :created
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def cookie_params
    new_params = params.require(:cookie).permit(:uid, :url, :accessTime)
    new_params[:access_time] = new_params[:accessTime]
    new_params.delete(:accessTime)
    new_params
  end

  def ensure_json_request
    return if request.format == :json
    render nothing: true, status: 406
  end
end
