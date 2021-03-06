class SessionsController < ApplicationController

    skip_before_action :authorize

    def new
        # Present an empty login form
        @user = User.new
        @is_login = true
    end

    def create
        # Find the user that is trying to log in        
        user = User.where(email: params[:user][:email]).first
        if user && user.authenticate(params[:user][:password])
            # Store as a cookie in the users' browser the ID of them,
            # indicating that they are logged in
            # Saves long hexidecimal ID gobbldi password
            session[:user_id] = user.id.to_s
            redirect_to businesscards_path
        else
            # Go back to the login page
            redirect_to new_sessions_path
        end
    end

    def destroy
        reset_session
        redirect_to new_sessions_path
    end
end
