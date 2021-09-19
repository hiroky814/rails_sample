# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :session_limitable, :timeoutable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:user_id]

  validates :user_id, uniqueness: true
  validates :user_id, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def set(params)
    data = {}
    data[:user_id] = zero_padding(10, params[:user_id])
    data[:password] = params[:password]
    data[:company_name] = params[:company_name]
    data[:address] = params[:address]
    data[:person_in_charge] = params[:person_in_charge]
    data[:email] = params[:email]
    data[:phone_number] = params[:phone_number]
    data[:authority] = params[:authority]
    User.create!(data)
  end

  def update_user(params)
    user = User.find_by(user_id: params[:user_id])
    return if user.blank?

    user.password = params[:password] if params[:password].present?
    user.company_name = params[:company_name]
    user.address = params[:address]
    user.person_in_charge = params[:person_in_charge]
    user.email = params[:email]
    user.phone_number = params[:phone_number]
    user.save!
    user
  end

  def user_relation_destroy(id)
    user = User.find_by(user_id: id)
    return if user.blank?

    user.destroy
    vehicles = Vehicle.where(user_id: id)
    vehicle_list = vehicles.pluck(:vehicle_id)
    product_configurations = ProductConfiguration.where(vehicle_id: vehicle_list)

    vehicles.destroy_all if vehicles.present?
    product_configurations.destroy_all if product_configurations.present?

    { deleted_id: id }
  end

  private

  def zero_padding(n, val)
    val.rjust(n, '0')
  end
end
