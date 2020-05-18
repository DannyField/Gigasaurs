class Band < ApplicationRecord
    
    belongs_to :user

    has_many :band_users
    has_many :users, through: :band_users
    has_many :gigs

    has_one_attached :profile_picture

    # this means that the user must enter these into the form
    # validates :name, :about, presence: true
end