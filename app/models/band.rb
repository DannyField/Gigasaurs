class Band < ApplicationRecord
    
    # Don't do Belongs to User!!
    # belongs_to :user - don't allow this as it will somehow stop band entries from saving!!
    belongs_to :user

    has_many :band_users
    has_many :users, through: :band_users
    has_many :gigs

    has_one_attached :profile_picture

    # this means that the user must enter these into the form
    # validates :name, :about, presence: true
end