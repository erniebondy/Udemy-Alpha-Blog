module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    #email_address = user.email.downcase
    #hash = Digest::MD5.hexdigest(email_address)

    #require 'digest'
    #require 'uri'
    
    email_address = user.email.downcase    
    hash = Digest::SHA256.hexdigest(email_address)

    # Set default URL and size parameters
    default = "https://www.example.com/default.jpg"
    size = options[:size]
    
    image_tag("https://www.gravatar.com/avatar/#{hash}?s=#{size}", alt: user.username, class: "rounded shadow mx-auto d-block")
    
  end

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

end
