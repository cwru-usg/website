class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin!
    unless (authenticate_user! && current_user.is_admin?)
      return redirect_to root_url()
    end
  end
end
