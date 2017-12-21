class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :middle_name, :last_name, 
      :phone, :gender, :birthday, :graduation_date, :school, :organization])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :middle_name, :last_name, :phone, 
      :gender, :birthday, :graduation_date, :school, :organization, :email])
  end

  def finish_signup
    if request.patch? && params[:user] #&& params[:user][:email]
      @user = current_user
      if @user.update(params_sign_up_email)
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
    
  end
  def params_sign_up_email
    params.require(:user).permit(:email, :phone)
  end

end
