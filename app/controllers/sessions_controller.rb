class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      reset_session #added so attackers cannot provide an id to share the session
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      #remember user           was here instead of params
      redirect_to @user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
