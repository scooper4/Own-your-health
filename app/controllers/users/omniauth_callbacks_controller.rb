class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
       puts "Start persisted debug"
            puts request.env["omniauth.auth"]
            puts "End debug" 
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else

      session["devise.facebook_data"] = request.env["omniauth.auth"]
       puts "Start unpersisted debug"
            puts request.env["omniauth.auth"]
            puts @user.errors.to_a
            puts "End debug" 
      redirect_to new_user_registration_url
    end
  end
end