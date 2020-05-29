class PaymentsController < ApplicationController

        def success
            @gig = Gig.find(params[])
        end

        def webhook
        end
        
        def get_stripe_id
          @gig = Gig.find(params[:id])
          session_id = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
              name: @gig.title,
              description: @gig.description,
              amount: @gig.cost * 100,
              currency: 'aud',
              quantity: 1,
              }],
              payment_intent_data: {
                metadata: {
                user_id: current_user.id,
                listing_id: @gig.id
              }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&gigId=#{@gig.id}",
            cancel_url: "#{root_url}gigs"
          ).id
          render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
        end
      end

end
