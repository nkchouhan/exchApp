class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:firstName, :lastName, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :phone_number, :pin_code)
    }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  
  def after_sign_in_path_for(resource) 
     if resource.has_role? :admin
       admin_home_dashboard_path
     else
       home_dashboard_path
     end
  end 

	def after_sign_up_path_for(resource)
		root_path
	end 

	def after_update_path_for(resource)
		root_path
	end
	def check_admin?
	  unless current_user.has_role? :admin
			flash[:notice] = "Invalid Aceess"
			redirect_to home_dashboard_path
		end
	end
end
