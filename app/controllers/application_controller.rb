class ApplicationController < ActionController::Base
  class ApplicationController < ActionController::Base

    private
    def current_user
      @current_user ||= User.find_by_id session[:user_id]
    end
    helper_method :current_user
  
    def user_signed_in?
      current_user.present?
    end
    helper_method :user_signed_in?
  
    def authenticated_user!
      # redirect_to new_user_path, alert: 'Please sign in now' unless user_signed_in?  
      redirect_to root_path, alert: 'Please sign in' unless user_signed_in?
    end
    
    helper_method :authenticate_user!
  end
  
end
