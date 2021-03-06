class Users::RegistrationsController < Devise::RegistrationsController
 before_filter :configure_sign_up_params, only: [:create]
 before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
    # super
      @user = User.new
   end

  # POST /resource
   def create
    # super
      @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_path
    else
      render :new
    end
   end

  # GET /resource/edit
  # def edit
   #  super
  # end

  # PUT /resource
  # def update
   #  super
  #end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_up_params
     params.require(:user).permit(:name, :address, :gender, :contacts, :email, :password, :password_confirmation)
     devise_parameter_sanitizer.for(:sign_up)
   end

  # You can put the params you want to permit in the empty array.
   def configure_account_update_params
     params.require(:user).permit(:name, :address, :gender, :contacts, :email, :password, :password_confirmation)
     devise_parameter_sanitizer.for(:account_update)
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
