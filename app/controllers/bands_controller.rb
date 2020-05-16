class BandsController < ApplicationController
before_action :find_band ,only: [:show, :edit, :update, :destroy]
# load_and_authorize_resource
before_action :authenticate_user!
# before_action :set_band_gig, only: [:edit, :update, :destroy]
# before_action :set_user_band, only: [:edit, :update, :destroy]

    def index
        authenticate_user!
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
        # Ed helped with this code. So I know it works
        @band = Band.new(band_params)
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
        params.require(:band).permit(:name, :profile_picture, :about, :website, :user_id)
    end

    # def set_band_gig
    #     id = paramas[:id]
    #     @gig = current.user.gigs.find_by_id(id)
    #     if @gig == nil
    #         redirect_to_gigs_path
    #     end
    # end

# I need to get in my head, that a user would create a band, just like a listing!!! Just that a user doesn't sell a band
    def set_user_band
        id = params[:id]
        @band = current_user.bands.find_by_id(id)

        if @band == nil
            flash[:unauthorized] = "Not authorized to do that!"
            redirect_to bands_path
        end
    end

end


