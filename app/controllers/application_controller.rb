class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  
  ## Since this method is defined in the ApplicationController
  ## it is not available to the Views
  ## However, we can define the method as a 'helper' method

  helper_method :current_user, :logged_in?

  def current_user
    # if session[:user_id]
    #   User.find(session[:user_id])
    # end

    ## ||= operator checks if '@current_user' is present
    ## if not, the right hand statement is executed
    ## and also assigns the value to the variable
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    ## !! converts to boolean and returns (in this case)
    !!current_user
  end

  ## We need to prevent a user navigating to unauthorized links via the URL
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perfom that action!"
      redirect_to root_path
    end
  end
    
end
