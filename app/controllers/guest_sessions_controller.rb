class GuestSessionsController < ApplicationController
  skip_before_action :login_required, only: [:create]
  def create
    user = User.find_or_create_by(email: "guest@exapmle.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.client = true
    end
    session[:user_id] = user.id
    flash[:success] = "ゲストユーザーとしてログインしました"
    redirect_to pets_path
  end
end
