class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    has_many :band_users
    has_many :bands, through: :band_users

    has_one_attached :profile_photo

  def admin?
    if self.email.ends_with('@gigasaurs.com')
      #admin@gigasaurs.com
      if self.email.split('@').first == 'admin'
        return true
      end
    end
    false
  end
end
