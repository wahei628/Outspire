class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :alert

  skip_before_action :require_login, if: -> { params[:id] == 'privacy_policy' && controller_name == 'pages' }
  skip_before_action :require_login, if: -> { params[:id] == 'about' && controller_name == 'pages' }

  private

  def not_authenticated
    redirect_to login_path
    flash[:alert] = 'ログインしてください。'
  end
end
