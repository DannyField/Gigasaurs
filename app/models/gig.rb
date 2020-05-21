class Gig < ApplicationRecord
  # A gig belongs to a band. I didn't want any random user from creating gigs.
  # Nor from adding bands they didn't belong to. So a band can only create a gig.
  belongs_to :band

  # These validations ensures that the gig information is entered in the form.
  validates :title, presence: true
  validates :venue, presence: true
  validates :location, presence: true
  validates :gig_details, presence: true
  validates :support, presence: true
  validates :tickets_available, presence: true, numericality: { greater_than: 0 }
  validates :cost, presence: true, numericality: { greater_than: 0 }

  # A band might have a gig poster, so they can use Active Storage
  # and Active Record to upload gig posters
  has_one_attached :picture_upload
end

# Sure, someone could create a user account and then a band account and
# populate fake gigs. For future release I would look at authenication
# that ensures that a band is legit.
