class CartsController < ApplicationController

    def index
        if user_signed_in? && current_user.cart
            @cart = current_user.cart.gigs
            @gig_ids = @cart.map do |gig|
                gig.id
            end
        else
            redirect_to gigs_path
        end
    end


    def create
        # This will create a new cart
        if !current_user.cart
            cart = Cart.create(completed: false, user_id: current_user.id)
        else
            cart = current_user.cart
        end
        gig = Gig.find(params[:gig_id])
        cart.gigs << gig
        redirect_to gigs_path
    end    

end
