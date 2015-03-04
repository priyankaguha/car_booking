class Users::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     super do |resource|
       BackgroundWorker.trigger(resource)

     end
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_in_params
      params.require(:user).permit(:name, :address, :gender, :contacts, :email, :password, :password_confirmation)
     devise_parameter_sanitizer.for(:sign_in)
   end
end
