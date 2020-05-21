class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    # A user can perform at many gigs, so the association is a one to many
    has_many :gigs

    # A user may perform in many bands. So a one to many association is created.
    has_many :bands

    # A user may use Active Storage to upload an image, so this eager loading is used.
    has_one_attached :profile_photo

    # A band that the user belongs too, may also have other band members, so a many to many join table is used.
    has_many :band_users
    has_many :bands, through: :band_users

  #   def admin?
  #     if self.email.ends_with('@gigasaurs.com')
  #     #admin@gigasaurs.com
  #     if self.email.split('@').first == 'admin'
  #       return true
  #     end
  #   end
  #   false
  # end
end
