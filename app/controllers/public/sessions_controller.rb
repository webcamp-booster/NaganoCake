# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  before_action :customer_state ,only: [:create]

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

  def after_sign_in_path_for(resource) #会員のログイン後の遷移先
    root_path
  end

  def after_sign_out_path_for(resource) #会員のログアウト後の遷移先
    root_path
  end
  
  private
  # アクティブであるかを判断するメソッド
  def customer_state
    customer = Customer.find_by(email: params[:customer][:email])
    return if customer.nil?
    return unless customer.valid_password?(params[:customer][:password])
    unless customer.is_active == true
      redirect_to new_customer_registration_path, notice: '退会済みのため、再新規度登録が必要です。'
    end
  end
end