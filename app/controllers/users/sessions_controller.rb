class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  # around_action :check_captcha, only: [:create]

  #GET /resource/sign_in
  def new
    @captcha = show_captcha?
    super
  end

  #POST /resource/sign_in
  def create
    super
  end

  #DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def show_captcha?
    User.find_by_email(params[:user][:email]).access_locked? if params.key?(:user)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def check_captcha
    if @captcha = show_captcha?
      if verify_recaptcha
        User.find_by_email(params[:user][:email]).unlock_access!
      else
        self.resource = resource_class.new sign_in_params
        respond_with_navigational(resource) { render :new }
        #redirect_to :back
      end
    end
  end
end
