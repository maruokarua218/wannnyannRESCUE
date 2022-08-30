class PagesController < ApplicationController
  skip_before_action :login_required, only: [:home]

  def home
  end
end
