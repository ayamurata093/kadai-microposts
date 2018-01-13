class SessionsController < ApplicationController
  
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

private

  def login(email, password)
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
     # 許可するパラメータ
    def session_params
      params.require(:session).permit(:mail, :password)
    end
  end
end
