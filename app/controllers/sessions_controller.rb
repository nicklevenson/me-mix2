class SessionsController < ApplicationController
  def new
    
  end

  def create
    @errors = []
    @user = User.find_by(email: params[:email])
    if @user 
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @errors << 'Incorrect password'
        render :new
      end
    else
      @errors << 'Incorrect email'
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
