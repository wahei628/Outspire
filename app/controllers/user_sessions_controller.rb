class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path, success: 'ログインしました！'
    else
      flash.now[:alert] = 'ログインに失敗しました！'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, success: 'ログアウトしました！'
  end

  def guest_login
    # 固定のゲストユーザーの場合
    guest_user = User.find_by(email: 'guest@example.com') # ゲストアカウントのメールアドレス
    if guest_user
      auto_login(guest_user) # Sorceryの自動ログイン
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
    else
      redirect_to root_path, alert: 'ゲストログインに失敗しました'
    end
  end
end
