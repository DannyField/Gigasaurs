class BandsController < ApplicationController
    # Run the method find_bnd (in private) before all else, but only for show, edit, update and destroy 
    before_action :find_band ,only: [:show, :edit, :update, :destroy]
    
    # All users need to login.
    before_action :authenticate_user! ,only: [:new, :create, :edit, :update, :destroy, :index]
    
    # Cancancan authorise method. Currently disabled for this release
    # load_and_authorize_resource

    def index
        @bands = Band.all
    end

    def show
        # @band = Band.find(params[:id])
    end

    def new
        @band = Band.new
    end

    def create 
        # Ed helped with this code. So we know it works.
        @band = Band.new(band_params)
        # My god, I needed this to save the current user. It doesn't overwrite, as its @band.user.
        # It runs down the list, as typical ruby. The @band is the object, but the @band.user is an attribute of the @band
        @band.user = current_user
        # can change to email if I want the creator to add the right person. Will do this for next release.
        band_member = User.where(name: params[:band][:band_member])

        unless band_member.empty?
            @band.band_users.create(user_id: band_member.first.id)
        end
        
        @band.save
        flash[:success] = "You have created a new band"
        redirect_to @band
        end

    def edit
        # @band = Band.find(params[:id])
    end

    def update
        band_member = User.where(name: params[:band][:band_member])

        unless band_member.empty?
            @band.band_users.create(user_id: band_member.first.id)
        end
        
        # @band = Band.find(params[:id])
        @band.update(band_params)
        redirect_to @band
    end

    def destroy
        @band.destroy
        redirect_to bands_path
    end

    # Private keeps the code below safe from external manipulation
    private

    # Passes param ID (i.e. Band id), found in the Band table. Can be called by any method above now. In this case, it is called at the very start. See line 3
    def find_band
        @band = Band.find(params[:id])
    end

    # Band params, whitelisting and allowing these attributes to be used.
    def band_params
        params.require(:band).permit(:name, :profile_picture, :about, :website)
    end

end