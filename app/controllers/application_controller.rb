class ApplicationController < ActionController::API
  def route_not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

  #allow_browser versions: :modern
  
  # Skip CSRF protection for JSON requests (API)
  #protect_from_forgery with: :null_session, if: -> { request.format.json? }
end
