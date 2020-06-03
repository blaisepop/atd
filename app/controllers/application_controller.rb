class ApplicationController < ActionController::Base

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :search], unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected

  def after_sign_in_path_for(resource)
    playlists_path
  end
end
