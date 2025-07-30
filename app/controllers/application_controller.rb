class ApplicationController < ActionController::API
  def route_not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

  # Returns the currently logged-in user based on session
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  # Skip CSRF protection for JSON requests (API)
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
end
