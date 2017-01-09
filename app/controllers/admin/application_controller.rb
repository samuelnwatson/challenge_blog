class Admin::ApplicationController < ApplicationController

before_action :authorize_admin!

  def index
    @subscribers = all_subscribers
  end

  private

  def all_subscribers
    Article.get_subscribers
  end

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, alert: "You must have admin priveleges for that."
    end
  end
end
