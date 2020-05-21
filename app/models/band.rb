class Band < ApplicationRecord
    # A band belongs to a user.  
    belongs_to :user

    # A band can have many other users. Associations of a many to many. 
    # A band can have many users assigned to the same band.
    has_many :band_users
    has_many :users, through: :band_users

    # A band has many gigs. Even if it's just one, it will allow the band to create many gigs.
    has_many :gigs

    # An example of eager loading.
    has_one_attached :profile_picture

    # this means that the user must enter these into the form.
    validates :name, :about, presence: true
    # However I need to create a way to tell the user that the band wasn't created. Currently it goes back to the band page.

end