class BandsController < ApplicationController
before_action :find_band ,only: [:show, :edit, :update, :destroy]    

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
        @band = Band.new(band_params)
        @band.save

        redirect_to @band

        # I will most likely remove this as it should only be a user that can create a band
    end

    def edit
        # @band = Band.find(params[:id])
    end

    def update
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
        params.require(:band).permit(:name, :profile_picture, :about, :website, user_ids: [])
    end



end


