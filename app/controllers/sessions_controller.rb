class SessionsController < Devise::SessionsController

  protected

  # TODO add translation
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.is_blocked?
      sign_out resource
      flash[:error] = "This account has been suspended for violation of...."
      redirect_to root_path
    else
      super
    end
  end
end