# frozen_string_literal: true

class ApplicationController < ActionController::Base

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :admin || resource_name == :member
      'backoffice_devise'
    else
      'application'
    end
  end

  def user_not_authorized
    flash[:alert] = 'Você não está autorizado a executar esta ação'
    redirect_to(request.referer || root_path)
  end

  def pundit_user
    current_admin
  end

end
