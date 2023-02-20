# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  before_action :reject_inactive_customer, only: [:create]

  protected

  def reject_inactive_customer
    @customer = Customer.find_by(name: params[:customer][:name])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_customer_status
        redirect_to new_customer_session_path
      end
    end
  end
end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
