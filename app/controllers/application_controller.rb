class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include RescueFromInApp
  def after_sign_in_path_for(resource)
    if (resource.email == 'default@mustchange.com')
      return finish_signup_path(resource)
    end

    puts session[:split_id].inspect
    if (session[:split_id])
      return accept_splitments_path(session[:split_id])
    end

    if current_user.staff #Assuming there is such a function
      home_admin_path
    else
      session[:previous_url] || root_path
    end
  end
end 
