class BandUser < ApplicationRecord
  # This many to many (join table) brings bands and 
  # users together via foreign keys (band_id and user_id)
  belongs_to :band
  belongs_to :user
end
