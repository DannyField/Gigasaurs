class Gig < ApplicationRecord
belongs_to :band

    validates :title, presence: true
    validates :venue, presence: true
    validates :location, presence: true
    validates :gig_details, presence: true
    validates :support, presence: true

    validates :tickets_available, presence: true, numericality: { greater_than: 0 }
    validates :cost, presence: true, numericality: { greater_than: 0 }

    has_one_attached :picture_upload

end
