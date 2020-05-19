class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :gigs
    has_many :bands
    has_one_attached :profile_photo

    has_many :band_users
    has_many :bands, through: :band_users

    # Not sure about this line, as I originally set it up as bands can create gigs only

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
