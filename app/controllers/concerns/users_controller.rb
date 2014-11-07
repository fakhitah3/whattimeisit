class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            #success
            redirect_to root_path, flash: {success:  'Successfully created account'}
        else
            #fail
            render 'new'
        end
    end
    
    private
        
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
    
end
