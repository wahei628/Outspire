class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    notice_message = "#{provider.titleize}アカウントでログインしました"

    @user = login_from(provider)
    unless @user
      sorcery_fetch_user_hash(provider)
      @user = User.find_by(email: @user_hash[:user_info]['email'])

      if @user
        @user.add_provider_to_user(provider, @user_hash[:uid].to_s)
      else
        @user = create_from(provider)
      end

      reset_session
      auto_login(@user)
    end

    redirect_to root_path, notice: notice_message
  rescue StandardError
    redirect_to login_path, alert: "#{provider.titleize}アカウントでのログインに失敗しました"
  end

  private

  def auth_params
    params.permit(:code, :provider, :scope, :authuser, :prompt)
  end
end
