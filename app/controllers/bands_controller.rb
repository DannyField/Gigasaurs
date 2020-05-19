class BandsController < ApplicationController
before_action :find_band ,only: [:show, :edit, :update, :destroy]
# load_and_authorize_resource
before_action :authenticate_user! ,only: [:new, :create, :edit, :update, :destroy]


    def index
        authenticate_user!
        @bands = Band.all
        # @bands = Band.search(params[:search]) 
    end

    def show
        # @band = Band.find(params[:id])
    end

    def new
        @band = Band.new
    end

    def create 
        # Ed helped with this code. So I know it works
        @band = Band.new(band_params)
        # My god, I needed this to save the current user. It doesn't overwrite, as its @band.user
        @band.user = current_user
        # can change to email if I want the creator to add the right person
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

private

    def find_band
        @band = Band.find(params[:id])
    end

    def band_params
        params.require(:band).permit(:name, :profile_picture, :about, :website)
    end

end