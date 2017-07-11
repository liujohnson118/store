class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if User.where(email:user.email.downcase).count<1
      if (user.save)
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    else
      raise ActionController::RoutingError.new('Error creating user profile. User email already exists! Choose a different email')
    end
  end

  def index
    @users=User.all
  end
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
end
