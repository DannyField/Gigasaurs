class BandsController < ApplicationController
before_action :find_band ,only: [:show, :edit, :update, :destroy]
load_and_authorize_resource
before_action :authenticate_user!
# accepts_nested_attributes_for :user
# before_action :set_band_gig, only: [:edit, :update, :destroy]

    def index
        @bands = Band.all 
    end

    def show
        # @band = Band.find(params[:id])
    end

    def new
        authenticate_user!
        @band = Band.new
    end

    def create
        authenticate_user!
        @band = Band.new(band_params)
        band_member = User.where(name: params[:band][:band_member])

        unless band_member.empty?
            @band.band_users.create(user_id: band_member.first.id)
        end
        
        @band.save

        redirect_to @band

        # I will most likely remove this as it should only be a user that can create a band
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
        # params.require(:model).permit(:fields)
        # nested
        # params.require(:person) .permit(:name, :age, user_attributes: [:id, :name])

    end

    # def set_band_gig
    #     id = paramas[:id]
    #     @gig = current.user.gigs.find_by_id(id)
    #     if @gig == nil
    #         redirect_to_gigs_path
    #     end
    # end

end


