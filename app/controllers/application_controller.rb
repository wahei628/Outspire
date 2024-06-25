class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :alert

  private

  def not_authenticated
    redirect_to login_path
    flash[:alert] = 'ログインしてください。'
  end
end
