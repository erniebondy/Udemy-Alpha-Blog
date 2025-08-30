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

end
