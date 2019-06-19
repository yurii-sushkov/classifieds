module ApplicationHelper
  def is_user_admin?
    if !current_user or !current_user.admin
      flash[:alert] = "You do not have an access"
      redirect_to root_path
    end
  end
end
