class AdminGuestSessionsController < ApplicationController
  skip_before_action :login_required, only: [:create]
  def create
    user = User.find_or_create_by(email: "guest_admin@exapmle.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト管理者ユーザー"
      user.client = true
      user.admin = true
    end
    session[:user_id] = user.id
    flash[:success] = "ゲスト管理者ユーザーとしてログインしました"
    redirect_to pets_path
  end
end
