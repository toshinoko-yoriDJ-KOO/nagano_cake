# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
# ごう作
# 新規登録が行われる前に
  before_action :customer_state, only: [:create]
  
  protected
# 退会しているかどうかを判断する
  def customer_state
  # find_byでID以外のカラムを取得...モデル名.find_by(カラム名: 検索する値)
    @customer = Customer.find_by(email: params[:customer][:email])
  # 取得なければメゾットの終了
    return if !@customer
  # 取得したアカウントのパスワードと入力されたパスワードが一致しているかどうか...ユーザー情報.valid_password?(入力されたパスワード)
    if @customer.valid_password?(params[:customer][:password]) && !(@customer.is_active == true)
      redirect_to new_customer_registration_path
    else
      redirect_to customer_session_path
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
end
