class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index]
  
  def after_sign_in_path_for(resource)
    user_categories_path(current_user)
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name bio password password_confirmation])
  end
  
  def devise_controller?
    devise_controller_names.include?(controller_name)
  end

  def devise_controller_names
    %w[registrations sessions passwords confirmations unlocks]
  end
end
