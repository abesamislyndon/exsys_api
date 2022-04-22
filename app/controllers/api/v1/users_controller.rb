class Api::V1::UsersController  <  Api::ApplicationController
  
  before_action :authenticate_request!

    def index
      userlist = User.all
      render json: userlist
    end
  
    def create
        newuser = User.create(user_params)
        if  newuser.save
          render json: newuser, status: 201
        else
          render json: { status: 500, errors: newuser.errors }
        end
    end
  
    def edit
      users = User.find(params[:id])
    end
  
    def edit_password
      users = User.find(params[:id])
    end
  
    def show
      users = User.find(params[:id]) 
      render json: users , status: 201 
    end
  
    def update
      userupdate = User.find(params[:id])
        if userupdate.update!(user_params) 
          render json: userupdate, status: 201 
       end                 
  end
  
    def update_password
      user = User.find(params[:id])
      respond_to do |format|
        if user.update(user_params)
           render json: user, status: 201
        end
      end
    end
  
    def destroy
      user = User.find(params[:id])
      if  user.delete
          render json: user, status: "successful"
      end
    end
  
    private
  
    def user_param
      params.require(:user).permit(:email, :role, :username)
    end
  
    def user_params
      params.require(:user).permit(:username, :email, :role, :password, :password_confirmation)
    end
  end
  