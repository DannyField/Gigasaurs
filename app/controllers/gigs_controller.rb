class GigsController < ApplicationController
before_action :find_gig ,only: [:show, :edit, :update, :destroy]
# load_and_authorize_resource    
before_action :authenticate_user! ,only: [:show, :index, :new, :create, :edit, :update, :destroy]

    def index  
        @gigs = Gig.all
    end

    def show
        # @gig = Gig.find(params[:id])
    end

    def new
        @gig = Gig.new
    end

    def create
   
        # orig
        @gig = Gig.new(gig_params)
        
        # @gig = Gig.new(gig_params)
        # @gig.band_id = current_user[:user_id]
        
        @gig.band_id = current_user.id

        @gig.save
        flash[:success] = "You have created a new gig post! Rock on!"
        redirect_to @gig

        # @gig = Gig.new(gig_params)
        # @gig.save

        # redirect_to @gig
    end

    def edit
        # @gig = Gig.find(params[:id])
    end

    def update
        # @gig = Gig.find(params[:id])
        @gig.update(gig_params)

        redirect_to @gig
    end

    def destroy
        @gig.destroy
        redirect_to gigs_path
    end


    private

    def find_gig
        @gig = Gig.find(params[:id])
    end

    def gig_params
        params.require(:gig).permit(:title, :venue, :location, :date, :start_time, :end_time, :gig_details, :support, :tickets_available, :cost, :picture_upload)
    end

end

