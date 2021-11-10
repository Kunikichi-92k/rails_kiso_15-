class Admin::UserSessionsController < Admin::BaseController # BaseControllerを継承
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_admin, only: %i[new create]
  layout 'layouts/admin_login'

  def new; end

  def create
    @user = login(params[:email], params[:password]) # Sorceryメソッド。emailとpasswordでログイン認証する。
    if @user
      redirect_to admin_root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: t('.success')
  end
end
