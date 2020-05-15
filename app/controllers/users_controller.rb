class UsersController < ApplicationController
before_action :find_user ,only: [:show, :edit, :update, :destroy]    
before_action :authenticate_user!

    def index 
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end
    
        def new

            @user = User.new
            
        end
    
        def create
            @user = User.new(user_params)
            @user.save
    
            redirect_to @user
    
            # I will most likely remove this as it should only be a user that can create a band
        end
    
        def edit
            # @user = User.find(params[:id])
        end
    
        def update
            # @user = User.find(params[:id])
            @user.update(user_params)
    
            redirect_to @user
        end
    
        def destroy
            @user.destroy
    
            redirect_to user_path
        end
    
    
        private
    
        def find_user
            @user = User.find(params[:id])
        end
    
        def user_params
            params.require(:user).permit(:name, :profile_photo, :about, :location)
        end
    
        # def user_params
        #     params.require(:user).permit(band_ids: [])
        # end
end
    
    