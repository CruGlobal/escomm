class UsersController < ApplicationController
  # def fname:string
  # end

  # def lname:string
  # end

  # def email:string
  # end
  def index
  end

  def contact
    h = JSON.generate({ 'name' => params[:name],
                        'email' => params[:email],
                        'message' => params[:message] })
    
    HardWorker.perform_async(h, 5)

    # if instead of sidekiq I was just sending email from rails
    #UserMailer.send_email(@name, @email, @message).deliver

    redirect_to :root
  end
end
