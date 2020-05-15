class Band < ApplicationRecord
    
    # Don't do Belongs to User!!
    # belongs_to :user - don't allow this as it will somehow stop band entries from saving!!

    has_many :band_users
    has_many :users, through: :band_users
    has_many :gigs

    has_one_attached :profile_picture
end
