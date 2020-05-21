class GigsController < ApplicationController
  # Run the method find_gig (in private) before all else, but only for show, edit, update and destroy
  before_action :find_gig, only: [:show, :edit, :update, :destroy]

  # All users need to login. Makes sure that user are logged in
  before_action :authenticate_user!, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  # Cancancan authorise method. Currently disabled for this release
  # load_and_authorize_resource

  def index
    @gigs = Gig.all
  end

  def show
    # This line isn't needed as it's now called within the method find_gig, and before_action.
    # @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.save
    flash[:success] = "You have created a new gig post! Rock on!"
    redirect_to @gig
  end

  def edit
    # This line isn't needed as it's now called within the method find_gig, and before_action.
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

  # Private keeps the code below safe from external manipulation
  private

  # Passes param ID (i.e. gig id), found in the Gig table. Can be called by any method above now. In this case, it is called at the very start. See line 3
  def find_gig
    @gig = Gig.find(params[:id])
  end

  # Gig params, whitelisting and allowing these attributes to be used. Also note the foreign key :band_id that links with the band model
  def gig_params
    params.require(:gig).permit(:title, :venue, :location, :date, :start_time, :end_time, :gig_details, :support, :tickets_available, :cost, :picture_upload, :band_id)
  end
end
