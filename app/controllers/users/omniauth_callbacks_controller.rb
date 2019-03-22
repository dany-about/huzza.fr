class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook

    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      @user.remember_me = true
      sign_in @user, event: :authentication
      redirect_to dares_path
    else
      session['devise.auth'] = request.env['omniauth.auth']
      render :edit
    end

  end

  def sign_up_validation

    @user = User.from_omniauth(session['devise.auth'])

    if @user.update(user_params)
      sign_in_and_redirect @user, event: :authentification
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :image)
  end

end