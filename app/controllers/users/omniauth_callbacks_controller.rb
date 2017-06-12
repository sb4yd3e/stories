class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # userful debugging code, insert the following to see the response from oauth
  # provider:
  # render :text => "<pre>" + env["omniauth.auth"].to_yaml and return


  def facebook
    @user = User.find_or_create_from_facebook_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def twitter
    @user = User.find_or_create_from_twitter_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.find_or_create_from_google_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def weibo
    @user = User.find_or_create_from_weibo_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Weibo") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def wechat
    @user = User.find_or_create_from_wechat_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Wechat") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def qq_connect
    @user = User.find_or_create_from_qq_connect_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "QQ") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  private

    def auth_hash
      request.env["omniauth.auth"]
    end
end
