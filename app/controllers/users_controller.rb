class UsersController < ApplicationController
# Run the method find_user (in private) before all else, but only for show, edit, update and destroy 
before_action :find_user ,only: [:show, :edit, :update, :destroy]

# All users need to login.
before_action :authenticate_user!

# Cancancan authorise method. Currently disabled for this release
# load_and_authorize_resource

    def index 
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

        # Creates a new User object; initialises an empty user object in memory.
        def new
            @user = User.new

        end
    
        def create
            @user = User.new(user_params)
            @user.save
            redirect_to @user
        end
    
        def edit
            # This line isn't needed as it's now called within the method find_gig, and before_action.
            # @user = User.find(params[:id])
        end
    
        def update
            @user.update(user_params)
    
            redirect_to @user
        end
    
        def destroy
            @user.destroy
    
            redirect_to user_path
        end
    
        # Private keeps the code below safe from external manipulation
        private

        # Passes param ID (i.e. user ID), found in the User table. Can be called by any method above now. Inthis case, it is called at the very start. See line 3   
        def find_user
            @user = User.find(params[:id])
        end
    
        # User params, whitelisting and allowing these attributes to be used.
        def user_params
            params.require(:user).permit(:name, :profile_photo, :about, :location)
        end
end
    
    