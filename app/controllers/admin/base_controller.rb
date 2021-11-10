class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  # ログインしていない時実行される(sorceryのメソッド)
  def not_authenticated
    flash[:warning] = t('default.message.require_login')
    redirect_to admin_login_path
  end

  # 管理者権限がないユーザーを弾く
  def check_admin
    redirect_to root_path, warning: t('defaults.message.not_authorized') unless current_user.admin?
  end
end
