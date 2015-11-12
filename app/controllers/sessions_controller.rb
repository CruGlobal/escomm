class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      # Log the user in and redirect to the user's show page.
      log_in user
    else
      # Create an error message.
    end
  end

  def destroy
  end
end