# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  # usernameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if conditions.delete(:login)
      # 認証の条件式を変更する
      where(conditions).where(['user_id = :value', { value: user_id }]).first
    else
      where(conditions).first
    end
  end

  def admin_check
    redirect_to controller: 'top', action: 'index' if current_user[:authority].blank? || current_user[:authority] == 0
  end

  def send_file_headers!(options)
    super(options)
    match = /(.+); filename="(.+)"/.match(headers['Content-Disposition'])
    encoded = URI.encode_www_form_component(match[2]).gsub('+', '%20')
    headers['Content-Disposition'] = "#{match[1]}; filename*=UTF-8''#{encoded}" unless encoded == match[2]
  end

  protected

  def store_current_location
    store_location_for(:user, request.url)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:user_id, :password, :remember_me) }
  end
end
