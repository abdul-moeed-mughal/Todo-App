class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token, only: [:bulk_update]

  def require_admin_login
    if user_signed_in?
      unless current_user.admin
        respond_to do |format|
          format.html {redirect_to root_path, alert: "You are not authorised to access this page."}
        end
      end
    else
      respond_to do |format|
        format.html {redirect_to root_path, alert: "You must login."}
      end
    end
  end
end
