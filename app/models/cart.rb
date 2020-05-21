class Cart < ApplicationRecord
    # many to many relationship : a join table
    has_many :cart_gigs
    has_many :gigs, through: :cart_gigs

    # A cart belongs to a user
    belongs_to :user
end
