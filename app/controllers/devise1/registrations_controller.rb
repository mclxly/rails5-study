class Devise::RegistrationsController < ApplicationController
  helper_method :resource, :resource_name, :devise_mapping
  
  def after_sign_up_path_for(resource)
    session[:plan_id] = params[:plan_id]
    setup_organization_path(:organization_setup)
  end
end
