class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    "/user/#{current_user.id}"
  end

  protected

  def configure_permitted_parameters
    # 下記を定義したらbeforeactionで使うように呼び出すこと
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end

  
end
