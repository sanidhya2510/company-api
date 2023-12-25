class LogoutController < ApplicationController
    def logout_and_redirect
        sign_out(current_user) if user_signed_in?
        redirect_to root_path, notice: 'You have been logged out.'
    end
end
