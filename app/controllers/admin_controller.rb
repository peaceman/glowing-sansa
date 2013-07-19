class AdminController < ApplicationController
  before_filter :ensure_user_is_admin!

  def ensure_user_is_admin!
    head :forbidden unless current_user.is_admin?
  end
end