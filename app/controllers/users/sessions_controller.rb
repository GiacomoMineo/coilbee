class Users::SessionsController < Devise::SessionsController
  clear_respond_to
  respond_to :json
  respond_to :html, :only => [:new]
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
	def new
		respond_to do |format|
			# as the login form is displayed on the root page, redirect there
			# if the user accesses /users/sign_in directly
			format.html {redirect_to root_path}
			format.json {super}
		end
	end

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
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
