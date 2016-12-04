class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Facebook'
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      flash[:notice] = 'Looks like you already have an account with the same email. Please login using a different method first to connect with Facebook.'
      redirect_to new_user_session_url
    end
  end

  def failure
    flash[:error] = 'Oops! Looks like something went wrong... :('
    redirect_to root_path
  end
end
