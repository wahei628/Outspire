class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :restrict_guest_user, only: %i[edit update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar)
  end

  def restrict_guest_user
    if current_user.email == 'guest@example.com'
      redirect_to profile_path, alert: 'ゲストユーザーはプロフィールを編集できません'
    end
  end
end
